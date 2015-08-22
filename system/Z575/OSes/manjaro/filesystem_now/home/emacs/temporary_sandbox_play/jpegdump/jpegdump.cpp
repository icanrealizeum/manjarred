//
// Copyright (c) 1997 Colosseum Builders, Inc.
// All rights reserved.
//
// Colosseum Builders, Inc. makes no warranty, expressed or implied
// with regards to this software. It is provided as is.
//
// Permission to use, redistribute, and copy this file is granted 
// without a fee so long as as the following conditions are adhered to:
//
// o The user assumes all risk for using this software. The authors of this
//   software shall be liable for no damages of any kind.
//
// o If the source code is distributed then this copyright notice must
//   remain unaltered and any modification must be noted.
//
// o If this code is shipped in binary format the accompanying documentation
//   should state that "this software is based, in part, on the work of
//   Colosseum Builders, Inc."
//
//
// Program: JPEGDUMP
//
//  This program dumps the contents of a JFIF file to stdou.
//
// Author:  John M. Miano miano@worldnet.att.net
//
#include <fstream>
#include <iostream>
#include <string.h>
#include <errno.h>

#include "markers.h"
#include "datatype.h"
#include "jfif.h"

using namespace std;

//#define VERBOSE       // Define VERBOSE if you want to dump data.

// This function creates a two byte integer from two individual bytes.
// this version is specific to little endian machines such as Intel PCs.
// For big endian machines the return values would be ((low << 8)| high)
UBYTE2 MakeWord (UBYTE1 hi, UBYTE1 lo)
{
  return (hi << 8) | lo ;
}

// This function converts a two byte integer from the big endian format
// used in JPEG files to the system format. This function is set for
// little endian machines. For big endian machines simply return the input
// value.
UBYTE2 SystemOrder (UBYTE2 data)
{
  UBYTE2 result ;
  result = ((data & 0x00FF) << 8) | ((data & 0xFF00) >> 8) ;
  return result ;
}

// Thsi function reads a single byte from the input stream.
UBYTE1 ReadByte (istream &strm)
{
  char data ;
  strm.read (&data, sizeof (data)) ;
  return (UBYTE1)data ;
}

// This function returns the next two byte integer in the input stream in
// the correct format for the processor.
UBYTE2 ReadWord (istream &strm)
{
  UBYTE1 hi = ReadByte (strm) ;
  UBYTE1 lo = ReadByte (strm) ;
	return MakeWord (hi, lo) ;
}

// This function dumps the contents of a start of frame or DHP marker to the
// output stream. The start of frame marker defines the size of the image,
// the number of components, and the attributes of the components.
void ReadStartOfFrame (istream &strm, unsigned int type)
{
  if (type == DHP)
  {
    cout << "( Define Hierarchical Progression" << endl ;
  }
  else
  {
    cout << "{ Start Of Frame " << endl ;
    switch (type)
    {
    case SOF0:
      cout << "  Type: Baseline (Huffman)" << endl ;
      break ;
    case SOF1:
      cout << "  Type: Sequential DCT (Huffman)" << endl ;
      break ;
    case SOF2:
      cout << "  Type: Progressive DCT (Huffman)" << endl ;
      break ;
    case SOF3:
      cout << "  Type: Spatial (sequential) lossless (Huffman)" << endl ;
      break ;
    case SOF5:
      cout << "  Type: Differential Sequential DCT" << endl ;
      break ;
    case SOF6:
      cout << "  Type: Differential Progressive DCT" << endl ;
      break ;
    case SOF7:
      cout << "  Type: Differential Spatial" << endl ;
      break ;
    case SOF9:
      cout << "  Type: Extended Sequential DCT" << endl ;
      break ;
    case SOFA:
      cout << "  Type: Progressive DCT" << endl ;
      break ;
    case SOFB:
      cout << "  Type: Spacial (sequential) Lossless (Arithmetic)" << endl ;
      break ;
    case SOFD:
      cout << "  Type: Differential Sequential DCT (Arithmetic)" << endl ;
      break ;
    case SOFE:
      cout << "  Type: Differential Progressive DCT (Arithmetic)" << endl ;
      break ;
    case SOFF:
      cout << "  Type: Differential Spatial (Arithmetic)" << endl ;
      break ;
    }
  }
  // Section B.2.2 (SOF)
  // Section B.3.2 (DHP - which says is identical to B.2.2)

  cout << "  Length: " << dec << ReadWord (strm) << endl ;
  cout << "  Precision: " << dec << (unsigned int)ReadByte (strm) << endl ; // P in standard
  cout << "  Height: " << dec << ReadWord (strm) << endl ;            // Y in standard
  cout << "  Width: " << dec << ReadWord (strm) << endl ;             // X in standard
  int component_count = ReadByte (strm) ;     // Nf in standard
  cout << "  Component Count: " << component_count << endl ;

  for (int ii = 0 ; ii < component_count ; ++ ii)
  {
    cout << "   Component " << (unsigned int) ReadByte (strm) << endl ; // Ci in standard
    UBYTE1 data = ReadByte (strm) ;
    cout << "   Horizontal Frequency: " << (data >> 4) << endl ; // Hi in standard
    cout << "   Vertical Frequency: " << (data & 0xF) << endl ; // Vi in standard
    cout << "   Quantization Table: " << (unsigned int) ReadByte (strm) << endl ;  // Tqi in standard
  }
  cout << "}" << endl ;
  return ;
}

// This function dumps the contents of a DHT marker to the output stream.
// Huffman tables are stored in two parts. First there is an array containing
// 16 values where each value is the count of codes for with a given length.
// The next is a variable array that contains the Huffman values. The number
// of values is the sum of all the counts.
void ReadDefineHuffmanTables (istream &strm)
{
  cout << "{ Define Huffman Table" << endl ;

  // Section B.2.4.2

   UBYTE2 length = ReadWord (strm) ;
   cout << "  Length: " << dec << length << endl ;
   unsigned int remaining = length - sizeof (length) ;
   while (remaining > 0)
   {
      UBYTE1 data = ReadByte (strm) ; -- remaining ;
      unsigned int tableclass = data >> 4 ;    // Tc in standard 0=>DC, 1=>AC
      unsigned int id = data & 0x0F ;          // Th in standard

      cout << "   Table Index " << (int) id << endl ;
      if (tableclass == 0)
        cout << "   Table Class: DC" << endl ;
      else
        cout << "   Table Class: AC" << endl ;

      cout << "   Code Counts: " ;
      int count = 0 ;
      for (int jj = 0 ; jj < 16 ; ++ jj)
      {
        UBYTE1 codecount = ReadByte (strm) ;
        // These values are called Li in the standard.
        cout << hex << (unsigned int) codecount << " " ; -- remaining ;
        count += codecount ;
      }
      cout << endl ;
      cout << "   Code Values: " ;
      for (int jj = 0 ; jj < count ; ++ jj)
      {
        // These values are called Vi in the standard.
        cout << hex << (unsigned int) ReadByte (strm) << " "  ; -- remaining ;
      }
      cout << endl ;
   }
   cout << "}" << endl ;

   return ;
}

// This function reads a DAC block from the input stream. Since Arithmetic
// coding is covered by patents we ignore the contents and just dump them
// to the output stream.
void ReadDefineArithmeticCoding (istream &strm)
{
  // The actual format is in B.2.4.3

  cout << "{ Define Arithmetic Coding " << endl ;
  unsigned int length = ReadWord (strm) ;
  cout << "  Length: " << dec << length << endl ;

  int count = 0 ;
  for (length -= sizeof (length) ; length > 0 ; -- length)
  {
    cout << " " << hex << (int) ReadByte (strm) ;
    if (count >= 15)
    {
      count = 0 ;
      cout << endl ;
    }
    else
    {
      ++ count ;
    }
  }
  cout << "}" << endl ;
  return ;
}

// This function reads an SOS marker and dumps its contents to the output
// stream. The scan data immediately follows the header but the data is not
// dumped here.
void ReadStartOfScan (istream &strm)
{
  cout << "{ Start Of Scan " << endl ;
  // Section B.2.3

  cout << "  Length:  " << dec << ReadWord (strm) << endl ;

  int scan_component_count = ReadByte (strm) ;  // Ns in standard

  for (int ii = 0 ; ii < scan_component_count ; ++ ii)
  {
    cout << "  Component ID: " << dec << (unsigned int) ReadByte (strm) << endl ;  // Csi in standard
    UBYTE1 rb = ReadByte (strm) ;
    cout << "  AC Entropy Table: " << dec << (rb & 0x0F) << endl  ;  // Tai in standard
    cout << "  DC Entropy Table: " << dec << (rb >> 4) << endl  ;    // Tdi in standard
  }

  cout << " Spectral Selection Start: " << dec << (unsigned int) ReadByte (strm) << endl ; // Ss in standard
  cout << " Spectral Selection End: " << dec << (unsigned int) ReadByte (strm) << endl ;  // Se in standard
  UBYTE1 ssa = ReadByte (strm) ;
  cout << " Sucessive Approximation High: " << dec <<(ssa >> 4) << endl ;  // Ah in standard
  cout << " Sucessive Approximation Low: " <<  dec << (ssa & 0x0F) << endl  ; // Al in standard

  cout << "}" << endl ;
  return ;
}

// This function reads the contents of a DQT marker and dumps it to the
// output stream. The quantization values can either be 8 or 16 bits. The
// values are stored in the file in zigzag order.
void ReadDefineQuantizationTable (istream &strm)
{
  cout << "{ Define Quantization Table" << endl ;
  // Defined in Section B.2.4.1

  UBYTE2 length = ReadWord (strm) ;

  UBYTE1 data ;
  int remaining = length - sizeof (length) ;
  cout << "  Length:  " << dec << length << endl ;

  while (remaining > 0)
  {
    data = ReadByte (strm) ; -- remaining ;
    unsigned int precision = data >> 4 ;    // Pq in standard
    unsigned int index = data & 0x0F ;      // Tq in standard
    cout << "  Table Index: " << dec << index << endl ;
    cout << "  Table Precision: " << dec << precision << endl ;

    cout << "  Table Values: " ;
    if ((precision & 0xF0) != 0)
    {
      for (unsigned int ii = 0 ; ii < 64 ;)
      {
        cout << endl << "        " ;
        for (int jj = 0 ; jj < 8 && ii < 64 ; ++ ii, ++ jj)
        {
          cout << dec << ReadWord (strm) << " " ;
          remaining -= 2 ;
        }
      }
    }
    else
    {
      for (unsigned int ii = 0 ; ii < 64 ;)
      {
        cout << endl << "        "  ;
        for (int jj = 0 ; jj < 8 && ii < 64 ; ++ ii, ++ jj)
        {
          cout << dec << (unsigned int) ReadByte (strm) << " " ;
          -- remaining ;
        }
      }
    }
  }

  cout << endl << "}" << endl ;
  return ;
}

// This function reads a DNL marker from the stream.
void ReadDefineNumberOfLines (istream &strm)
{
  // Defined in Section B.2.5
  cout << "{ Define Number of Lines" << endl ;
  cout << "  Length: " << dec << ReadWord (strm) << endl ; // Should be 4
  cout << "  Number of Lines: " << dec << ReadWord (strm) << endl ;
  cout << "}" << endl ;
  return ;
}

// This function reads a DRI marker from the input stream.
void ReadDefineRestartInterval (istream &strm)
{
  cout << "{ Define Restart Interval" << endl ;
  // Defined in Section B.2.4.4
  cout << "  Length:  " << dec << ReadWord (strm) << endl ; // Should be 4
  cout << "  Interval: " << dec << ReadWord (strm) << endl ;
  cout << "}" << endl ;
  return ;
}

// This function reads an EXP marker from the input stream.
void ReadExpandReferenceComponents (istream &strm)
{
  cout << "{ Expand Reference Components" << endl ;
  cout << "  Length: " << ReadWord (strm) << endl ; // Should be 3 ;
  UBYTE1 exp = ReadByte (strm) ;
  if ((exp & 0xF0) == 0)
    cout << "  Expand Horizontally: False" << endl ;
  else
    cout << "  Expand Horizontally: True" << endl ;
  if ((exp & 0x0F) == 0)
    cout << "  Expand Vertically: False" << endl ;
  else
    cout << "  Expand Vertically: True" << endl ;
  return ;
}

// This function reads a JFIF header.
void ReadApp0 (istream &strm)
{
  cout << "{ APP0 Marker" << endl ;

  // Information for decoding the APP0 block comes from:
  // JPEG File Interchange Format
  // Version 1.02

  JfifHeader header ;
  strm.read ((char *) &header, sizeof (header)) ;

  cout << "  Length: " << dec << SystemOrder (header.length) << endl ;

  cout << "  Version: " << dec << (unsigned int) header.version [0] << "." << (unsigned int) header.version [0] << endl ;

  // density unit = 0 => Only the aspect ratio is specified.
  // density unit = 1 => Density in pixels per inch.
  // density unit = 2 => Density in pixels per centimeter.
  cout << "  Density Unit: " ;
  switch (header.units)
  {
  case 0:
    cout << " (aspect ratio)" << endl ;
    break ;
  case 1:
    cout << " (pixels per inch)" << endl ;
    break ;
  case 2:
    cout << " (pixels/cm)" << endl ;
    break ;
  default:
    cout << " (????)" << endl ;
    break ;
  }
  cout << "  X Density: " << dec << SystemOrder (header.xdensity) << endl ;
  cout << "  Y Density: " << dec << SystemOrder (header.xdensity) << endl ;

  cout << "  Thumbnail Width: " << dec << (unsigned int) header.xthumbnail << endl ;
  cout << "  Thumbnail Height: " << dec << (unsigned int) header.xthumbnail << endl ;

  for (int ii = sizeof (header) ; ii < SystemOrder (header.length) ; ++ ii)
    (void) ReadByte (strm) ;

  cout << "}" << endl ;
	return ;
}
// This function read an APPx or COM marker from the input stream and
// dumps its contents.
void ReadApp (istream &strm, unsigned int data)
{
  switch (data)
  {
  case APP1:
    cout << "{ APP1 Marker" << endl ;
    break ;
  case APP2:
    cout << "{ APP2 Marker" << endl ;
    break ;
  case APP3:
    cout << "{ APP3 Marker" << endl ;
    break ;
  case APP4:
    cout << "{ APP4 Marker" << endl ;
    break ;
  case APP5:
    cout << "{ APP5 Marker" << endl ;
    break ;
  case APP6:
    cout << "{ APP6 Marker" << endl ;
    break ;
  case APP7:
    cout << "{ APP7 Marker" << endl ;
    break ;
  case APP8:
    cout << "{ APP8 Marker" << endl ;
    break ;
  case APP9:
    cout << "{ APP9 Marker" << endl ;
    break ;
  case APPA:
    cout << "{ APPA Marker" << endl ;
    break ;
  case APPB:
    cout << "{ APPB Marker" << endl ;
    break ;
  case APPC:
    cout << "{ APPC Marker" << endl ;
    break ;
  case APPD:
    cout << "{ APPD Marker" << endl ;
    break ;
  case APPE:
    cout << "{ APPE Marker" << endl ;
    break ;
  case APPF:
    cout << "{ APPF Marker" << endl ;
    break ;
  case COM:
    cout << "{ Comment Marker" << endl ;
    break ;
  }

  // Defined in Section B.2.4.5 (COM)
  // Defined in Section B.2.4.6 (APPx)

  char buffer [512] ;
  UBYTE2 length = ReadWord (strm) ;
  cout << "  Length: " << dec << length << endl ;

  volatile int ii = 0 ;
  buffer [ii] = ReadByte (strm) ;
  for (ii = 1 ; buffer [ii - 1] != '\000'
                && ii < sizeof (buffer)
                && ii < length - sizeof (length) ; ++ ii)
  {
    buffer [ii] = ReadByte (strm) ;
  }

  cout << buffer << endl ;
  // If there are any remaining header bytes then send them to the
  // bit bucket.
  for ( ; ii < length - sizeof (length) ; ++ ii)
    (void) ReadByte (strm) ;
  cout << "}" << endl ;
  return ;
}

void ReadMarker (istream &strm)
{
  // Find the next marker in the input stream. Dump data that is not a
  // marker. We expect to dump raw data following a SOS marker. We
  // also dump data when we have a bad marker.
  UBYTE1 data = ReadByte (strm) ;
  if (data != SOB)
  {
    unsigned int count = 0 ;
    while (data != SOB)
    {
ff00: // Special case of FF00 marker
      if (strm.eof ())
        return ;
#if defined (VERBOSE) 
      cout << hex << (unsigned int) data << " " ;
      if (count >= 15)
      {
        cout << endl ;
        count = 0 ;
      }
      else
      {
        ++ count ;
      }
#endif
      data = ReadByte (strm) ;
    }
    data = ReadByte (strm) ;
    if (data == 0)
    {
      // FF00 is used to represent the value FF in the output stream.
      data = 0xFF ;
      goto ff00 ;
    }
    cout << endl ;
  }
  else
  {
    data = ReadByte (strm) ;
  }
  switch (data)
  {
  case SOF0:
  case SOF1:
  case SOF2:
  case SOF3:
  case SOF5:
  case SOF6:
  case SOF7:
  case SOF9:
  case SOFA:
  case SOFB:
  case SOFD:
  case SOFE:
  case SOFF:
  case DHP:
    ReadStartOfFrame (strm, data) ;
    break ;
  case DHT:
    ReadDefineHuffmanTables (strm) ;
    break ;
  case DAC:
    ReadDefineArithmeticCoding (strm) ;
    break ;
  case RST0:
    cout << "{ Restart 0 }" << endl ;
    break ;
  case RST1:
    cout << "{ Restart 1 }" << endl ;
    break ;
  case RST2:
    cout << "{ Restart 2 }" << endl ;
    break ;
  case RST3:
    cout << "{ Restart 3 }" << endl ;
    break ;
  case RST4:
    cout << "{ Restart 4 }" << endl ;
    break ;
  case RST5:
    cout << "{ Restart 5 }" << endl ;
    break ;
  case RST6:
    cout << "{ Restart 6 }" << endl ;
    break ;
  case RST7:
    cout << "{ Restart 7 }" << endl ;
    break ;
  case SOI:
    cout << "{ Start Of Image SOI}" << endl ;
    break ;
  case EOI:
    cout << "{ End Of Image }" << endl ;
    break ;
  case SOS:
    ReadStartOfScan (strm) ;
    break ;
  case DQT:
    ReadDefineQuantizationTable (strm) ;
    break ;
  case DNL:
    ReadDefineNumberOfLines (strm) ;
    break ;
  case DRI:
    ReadDefineRestartInterval (strm) ;
    break ;
  case EXP:
    ReadExpandReferenceComponents (strm) ;
    break ;
  case APP0:
    ReadApp0 (strm) ;
    break ;
  case APP1:
  case APP2:
  case APP3:
  case APP4:
  case APP5:
  case APP6:
  case APP7:
  case APP8:
  case APP9:
  case APPA:
  case APPB:
  case APPC:
  case APPD:
  case APPE:
  case APPF:
  case COM:
    ReadApp (strm, data) ;
  }
  return ;
}


main (int argc, char *argv [])
{
  ifstream strm ;

  if (argc != 2)
  {
    cerr << "Usage: " << argv [0] << " file-name" << endl << flush ;
    return 1 ;
  }

  strm.open (argv [1], ios::binary) ;
  if (! strm)
  {
    cerr << "Can't open file '" << argv [1] << "'" << endl
         << strerror (errno) << endl << flush ;
    return errno ;
  }

  while (! strm.eof ())
    ReadMarker (strm) ;

  return 0 ;
}
