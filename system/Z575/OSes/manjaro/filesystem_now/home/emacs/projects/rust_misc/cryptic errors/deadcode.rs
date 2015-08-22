
//#[forbid(unreachable_code)]; //<- the semicolon makes it semi-global, not just affecting main fn below
#![forbid(unreachable_code)] //the shebang replaces semicolon
//TODO: find out how to include that in Cargo.toml

fn main() {
}

/*fn foo(x: i32) -> i32 {
    if x < 5 {
        x
/*
error: mismatched types:
 expected `()`,
    found `i32`
(expected (),
    found i32)
*/
    } else {
        x + 1                                                                                                 
/*
error: mismatched types:
 expected `()`,
    found `i32`
(expected (),
    found i32)
*/
    }
    1
}

fn foo2(x: i32) -> i32 {
    if x < 5 {
        x
/*
error: mismatched types:
 expected `()`,
    found `i32`
(expected (),
    found i32)
*/
    } else {
        x + 1                                                                                                 
/*
error: mismatched types:
 expected `()`,
    found `i32`
(expected (),
    found i32)
*/
    }
    return 1;
}
*/

fn foo_correct(x: i32) -> i32 {
    if x < 5 {
        x
    } else {
        x + 1                                                                                                 
    }
}

//#[forbid(unreachable_code)]  //<- this would affect only this function
fn fooexpected(x: i32) -> i32 {
    if x < 5 {
        return x;
    } else {
        return x + 1;
    }
    return 1; // warning: unreachable statement, #[warn(unreachable_code)] on by default
}

