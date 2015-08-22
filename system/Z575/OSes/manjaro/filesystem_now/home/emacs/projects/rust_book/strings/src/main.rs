
//src: http://doc.rust-lang.org/book/strings.html

fn main() {
    let mut s = "Hello".to_string(); // mut s: String
    println!("{}", s);
    s.push_str(", world.");
    println!("{}", s);

    let s = "Hello".to_string();
    takes_slice(s.as_slice());
    compare(s);
}

fn takes_slice(slice: &str) {
    println!("Got: {}", slice);
}

fn compare(string: String) {//good way
    //Viewing a String as a &str is cheap, but converting the &str to a String involves allocating
    //memory.
    if string.as_slice() == "Hello" {
        println!("yes");
    }
}

fn comparebad(string: String) {//"bad" way
    if string == "Hello".to_string() {
        println!("yes");
    }
}
