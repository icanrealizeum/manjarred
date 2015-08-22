//http://doc.rust-lang.org/book/crates-and-modules.html#importing-modules-with-use
//
pub use self::greetings::hello;
pub use self::farewells::goodbye;

mod greetings;

mod farewells;

