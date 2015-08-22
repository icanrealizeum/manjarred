use StringResult::StringOK;
use StringResult::ErrorReason;

enum StringResult {
    StringOK(String),
    ErrorReason(String),
}

fn respond(greeting: &str) -> StringResult {
    if greeting == "Hello" {
        StringOK("Good morning!".to_string())
    } else {
        ErrorReason("I didn't understand you!".to_string())
    }
}

fn sense(response: StringResult) {
    match response {
        StringOK(reply) => println!("{}",reply), // <- comma not semicolon!
        ErrorReason(er) => println!("{}",er), // <- comma not semicolon!
    }
}

fn main() {
//    let StringResult::StringOK(x) = respond("Hello");//Fixed: with sense above
//    println!("{}",x);
    sense(respond("Hello"));
    sense(respond("moo"));
}
