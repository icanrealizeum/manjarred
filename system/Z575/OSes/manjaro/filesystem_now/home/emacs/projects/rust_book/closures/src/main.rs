fn main() {
    println!("Hello, world!");
    let add_one = |&: x| { 1 + x };
    println!("The sum of 5 plus 1 is {}.", add_one(5));

    fn  fnadd_one      (x: i32) -> i32 { 1 + x };
    println!("The sum of 5 plus 1 is {}.", fnadd_one(5));

    let mut x: i32 = 5;
    let printer = |&:| { println!("x is: {}", x); };
    printer(); // prints "x is: 5"

    //    x = 6; // error: cannot assign to `x` because it is borrowed

    fn twice<F: Fn(i32) -> i32>(x: i32, f: F) -> i32 {
        f(x) + f(x)
    }
    let square = |&: x: i32| { x * x };
    println!("{}",twice(5, square)); // evaluates to 50
    println!("{}",twice(5, |x: i32| { x * x })); // evaluates to 50

    fn fnsquare(x: i32) -> i32 { x * x };
    println!("{}",twice(5, fnsquare)); // evaluates to 50

    //next: a fn that takes 2 closures
    //You might ask yourself: why do we need to introduce two type parameters F and G here?
    //Evidently, both f and g have the same signature: Fn(i32) -> i32.
    //That is because in Rust each closure has its own unique type. So, not only do closures with
    //different signatures have different types, but different closures with the same signature
    //have different types, as well!
    fn compose<F, G>(x: i32, f: F, g: G) -> i32
        where F: Fn(i32) -> i32, G: Fn(i32) -> i32 {
            g(f(x))
        }
    println!("{}", compose(5,
            |&: n: i32| { n + 42 },
            |&: n: i32| { n * 2 })); // evaluates to 94
}

