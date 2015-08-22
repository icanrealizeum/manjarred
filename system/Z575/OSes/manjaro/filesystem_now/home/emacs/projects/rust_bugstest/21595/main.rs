
//fn source: https://stackoverflow.com/questions/21747136/how-do-i-print-the-type-of-a-variable-in-rust          
fn print_type_of<T>(_: &T) -> () {
    let type_name =
        unsafe {
            (*std::intrinsics::get_tydesc::<T>()).name
        };
    println!("{}", type_name);
}

fn main() {
    //for i in 0..3 {//what's the inferred type from this?
    for i in 0..3 {//i32? yep
//  for i in range(0,3) {//what's the inferred type from this? https://github.com/rust-lang/rust/issues/21595 apparently integer fallback: i32
        if i % 2 == 0 {
            print!("*");
        }
        print!("{} ",i);
        print_type_of(&i);
    }
    println!("");
    //println!("{}", -1u32);
    }
