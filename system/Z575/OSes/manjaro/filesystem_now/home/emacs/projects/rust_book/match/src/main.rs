
//Rust has a keyword, match, that allows you to replace complicated if/else groupings with something more powerful. Check it out:
fn main() {
    //src: http://doc.rust-lang.org/book/match.html
    let x = 3;
    match x {
        1 => println!("one"),
        2 => println!("two"),
        3 => println!("three"),
        4 => println!("four"),
        5 => println!("five"),
        _ => println!("something else"),
    }

    //match is also an expression
    println!("{}", match x {
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        _ => "something else",
    });
}

// vim note: = , the indent command can take motions. So, gg to get the start of the file, = to indent, G to the end of the file, gg=G.
// src: https://stackoverflow.com/questions/506075/how-do-i-fix-the-indentation-of-an-entire-file-in-vi

