//this is to test vim syntastic, do :w to see warnings/errors
fn main() {
    for i in range(0,10) {//warning on this line
        println!("Hello, world!");//replace ; with 1 to see errors
    }
    ()
}
