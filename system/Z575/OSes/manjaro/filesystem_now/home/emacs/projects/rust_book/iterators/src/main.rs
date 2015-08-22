fn main() {
    println!("Hello, world!");
    for x in range(0, 10) {
        print!("{} ", x);
    }
    println!("");

    for x in 0..10 {
        print!("{:?} ", x);
    }
    println!("");

    for i in range(0,100)
//    for i in 0u32..100 // https://github.com/rust-lang/rust/issues/21595
    {
      i as f32;
    }

    let mut rang = range(0, 10);//bad if using binding name range here; https://github.com/rust-lang/rust/issues/21577
    loop {
        match rang.next() {//next returns an Option<i32>, in this case, which will be Some(i32) when we have a value and None once we run out. 
            Some(x) => {
                print!("{} ", x);
            },
            None => { break }
        }
    }
    println!("");


    let nums = vec![4, 2, 3];
    //wrong way:
    for i in range(0, nums.len()) {
        print!("{} ", nums[i]);
    }
    println!("");
    //still wrong:
    for i in 0..nums.len() {
        print!("{} ", nums[i]);
    }
    println!("");

//    for i in 0..3 { //need that type setting for the 0 value or else: 
    for i in -1i32..3 { //need that type setting for the 0 value or else: 
      if i % 2 == 0 { //this will err like this: error: the type of this value must be known in this context
          print!("*");
      }
      print!("{}",i);
    }

    //good:
    for num in nums.iter() {
        print!("{} ", num);
        //There's another detail here that's not 100% clear because of how println! works. num is
        //actually of type &i32. That is, it's a reference to an i32, not an i32 itself. println!
        //handles the dereferencing for us, so we don't see it. This code works fine too:
    }
    println!("");

    for num in nums.iter() {
        print!("{} ", *num);
    }
    println!("");


}
