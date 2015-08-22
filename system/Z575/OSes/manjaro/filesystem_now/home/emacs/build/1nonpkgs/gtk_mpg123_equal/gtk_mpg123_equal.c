#include <gtk/gtk.h>
#include <stdio.h>


struct equal_type
{
    GtkWidget *scale;
    GtkObject *adj;
    float val;
}   equal ;



struct  equal_type equal_array[32];



void save_file(GtkWidget *widget,GtkWidget *fileselect)
{
    int i;
    FILE *fe;
    fe = fopen(gtk_file_selection_get_filename(GTK_FILE_SELECTION(fileselect)),"w");
    if (fe)
    {

        for (i=0;i<32;i++)
        {
            float r;
            printf("%02i) %f\n",i,(GTK_ADJUSTMENT(equal_array[i].adj)->value));
            fprintf(fe,"%f %f\n",(GTK_ADJUSTMENT(equal_array[i].adj)->value),(GTK_ADJUSTMENT(equal_array[i].adj)->value));
        }
        fclose(fe);
        gtk_widget_destroy(fileselect);
    }
    
    
}

        

void load_file(GtkWidget *widget,GtkWidget *fileselect)
{

    FILE *fe;
    fe = fopen(gtk_file_selection_get_filename(GTK_FILE_SELECTION(fileselect)),"r");

    printf(" ... %d \n",sizeof(*gtk_file_selection_get_filename(GTK_FILE_SELECTION(fileselect))));
    if (fe)
    {
        char line[256];
        int i;
        for (i=0;i<32;i++)
        {
            float r,l;
            line[0]=0;
            fgets(line,255,fe);
            if(line[0] =='#') continue;
            sscanf(line,"%f %f",&r,&l);
            equal_array[i].val  =r;
            printf("%02i) %f\n",i,equal_array[i].val);
            gtk_adjustment_set_value(GTK_ADJUSTMENT(equal_array[i].adj),r);
        }
        fclose(fe);
    }


    gtk_widget_destroy(fileselect);
}



void destroy_this (GtkWidget *widget,GtkWidget *todestroy)
{

    gtk_widget_destroy(todestroy);
}



void create_file_box (GtkWidget *widget,gint *flag)
{


    GtkWidget *filew;

    if (flag==0) 
    {
        filew = gtk_file_selection_new("Open");
            gtk_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(filew)->ok_button),"clicked",
                               GTK_SIGNAL_FUNC(load_file),filew);
    }
    else
    {
        
        filew = gtk_file_selection_new("Save as  !!");
        gtk_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(filew)->ok_button),"clicked",
                           GTK_SIGNAL_FUNC(save_file),filew);
        
    }
    
    gtk_widget_show(filew);
    gtk_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(filew)->cancel_button),"clicked",
                       GTK_SIGNAL_FUNC(destroy_this),filew);

    
}






int main ()
{
	GtkWidget *window,*box;
        GtkWidget *frame;
        GtkWidget *button_box,*button;
	int i;
	
        
	gtk_init(NULL,NULL);

	// the main window 
	window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
	gtk_container_border_width(GTK_CONTAINER(window),20);
	gtk_signal_connect(GTK_OBJECT(window),"destroy",
			GTK_SIGNAL_FUNC(gtk_exit),NULL);
	gtk_widget_show(window);
	

	// the main box
	box = gtk_hbox_new(0,0);
        gtk_container_add(GTK_CONTAINER(window),box);
	gtk_widget_show(box);

	for (i = 0;i<32;i++)
	{
            gchar str[10];
            // the frame is here 
            sprintf(str," %i ",i);
            frame = gtk_frame_new(str);
            gtk_container_add (GTK_CONTAINER (box),frame );
            
            // Slide ..
            equal_array[i].adj =  gtk_adjustment_new (0.5, 0.0, 1.0, 0.01, 0.01, 0.01);
            equal_array[i].scale = gtk_vscale_new(GTK_ADJUSTMENT(equal_array[i].adj));
            gtk_range_set_inverted((GtkRange*)equal_array[i].scale, TRUE);
            gtk_scale_set_digits((GtkScale*)equal_array[i].scale, 3);
            gtk_container_add (GTK_CONTAINER (frame),equal_array[i].scale );
            gtk_widget_show(equal_array[i].scale);
            gtk_widget_show(frame);
	}


        button_box = gtk_vbox_new(0,0);
        gtk_container_add(GTK_CONTAINER(box),button_box);
        gtk_widget_show(button_box);
        
        button = gtk_button_new_with_label("Open");
        gtk_box_pack_start(GTK_BOX(button_box),button,0,0,10);
        gtk_signal_connect(GTK_OBJECT(button),"clicked",GTK_SIGNAL_FUNC(create_file_box),GINT_TO_POINTER(0));
        gtk_widget_show(button);        

        button = gtk_button_new_with_label("Save ");
        gtk_box_pack_start(GTK_BOX(button_box),button,0,0,10);
        gtk_signal_connect(GTK_OBJECT(button),"clicked",GTK_SIGNAL_FUNC(create_file_box),GINT_TO_POINTER(1));
        gtk_widget_show(button);        

	
	gtk_main();

	return 0;
}

