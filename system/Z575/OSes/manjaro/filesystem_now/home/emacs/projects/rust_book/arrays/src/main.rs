use std::io; //import module

fn main() {
    let a = [1, 2, 3]; // a: [i32; 3]
    let mut m = [1, 2, 3]; // mut m: [i32; 3]
    let a = [0; 20]; // a: [i32; 20]
    println!("a has {} elements", a.len());
    for e in a.iter() {
        println!("{}", e);
    }

    let names = ["Graydon", "Brian", "Niko"]; // names: [&str; 3]
    println!("The second name is: {}", names[1]);

    //vectors:
    let v = vec![1, 2, 3]; // v: Vec<i32>
    let mut nums = vec![1, 2, 3]; // mut nums: Vec<i32>
    nums.push(4);
    println!("The length of nums is now {}", nums.len()); // Prints 4

    //slices:
    let a = [0, 1, 2, 3, 4];
    let middle = &a[1..4]; // A slice of a: just the elements 1, 2, and 3

    for e in middle.iter() {
        println!("{}", e); // Prints 1, 2, 3
    }

    //input:
    println!("Type something!");
//    let input = std::io::stdin().read_line().ok().expect("Failed to read line");
//    let input = io::stdin().read_line().ok().expect("Failed to read line");
    let input = io::stdin() // std::io::stdio::StdinReader
        .read_line() // IoResult<String>
        .ok() // Option<String>
        .expect("Failed to read line"); // String
    println!("{}", input);

}
