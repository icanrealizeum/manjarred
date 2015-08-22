use std::cmp::Ordering;
use std::cmp::Ordering::Greater;

fn cmp(a: i32, b: i32) -> Ordering {
    if a < b { Ordering::Less }
    else if a > b { Greater }
    else { Ordering::Equal }
//    if a + b == 12 { Ordering::Greater } //the actual error is that this entire line should be unreachable(when uncommented) but it's understandable why it isn't
}

fn main() {
    let x = 5;
    let y = 10;

/*    let ordering = cmp(x, y); // ordering: Ordering

    if ordering == Ordering::Less {
        println!("less");
    } else if ordering == Greater {
        println!("greater");
    } else if ordering == Ordering::Equal {
        println!("equal");
    }*/

    //using match instead:
    match cmp(x, y) {
        Ordering::Less => println!("less"),
        Greater => println!("greater"),
        Ordering::Equal => println!("equal"),
    }
    /*This version has way less noise, and it also checks exhaustively to make sure that we have
     * covered all possible variants of Ordering. With our if/else version, if we had forgotten the
     * Greater case, for example, our program would have happily compiled. If we forget in the
     * match, it will not. Rust helps us make sure to cover all of our bases.
     * Exactly how I want it!*/
}

