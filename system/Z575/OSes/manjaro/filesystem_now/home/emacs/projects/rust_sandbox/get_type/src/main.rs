//source: https://stackoverflow.com/questions/21747136/how-do-i-print-the-type-of-a-variable-in-rust
fn print_type_of<T>(_: &T) -> () {
    let type_name =
        unsafe {
            (*std::intrinsics::get_tydesc::<T>()).name
        };
    println!("{}", type_name);
}

fn main() -> () {
    //mixing range into this
    for i in range(-3,10) {//falls back to i32 regardless of numbers https://github.com/rust-lang/rust/issues/21595
        if i % 9 == 0 {// -1%9==0
            print_type_of(&i);
        }
        print!("{} ",i);
    }
    println!("");
    for i in -1..10 {//<-- press % on that paren in vim! bug, fixed: 
//        if (i % 9 == 0) {//the type of this value must be known in this context
        print!("{} ",i);
        if i == 9 {//same error
            print_type_of(&i);
        }
    }
    let my_number = 32.90;
    print_type_of(&my_number);       // prints "f64"
    print_type_of(&(vec!(1, 2, 4))); // prints "collections::vec::Vec<i32>" at least with PR https://github.com/rust-lang/rust/pull/21806
}

