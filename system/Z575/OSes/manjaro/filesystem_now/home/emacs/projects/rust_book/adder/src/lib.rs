//! The `adder` crate provides functions that add numbers to other numbers.
//!
//! # Examples
//!
//! ```
//! assert_eq!(4, adder::add_two(2));
//! ```

extern crate test;

#[test]
#[should_fail]
fn it_works() {
    assert!(false);
    assert_eq!("Hello", "world");
}

#[test]
//#[should_fail(expected = "assertion failed")] // this works the same currently
#[should_fail(expected = "failed: false")]
fn it_works2() {
    assert!(false);
    assert_eq!("Hello", "world");
}


/*pub fn add_two(a: i32) -> i32 {
  a + 2
  }*/

#[test]
fn it_works3() {
    assert_eq!(4, add_two(2));
}


#[cfg(test)]
mod tests {
    use super::add_two;

    #[test]
    fn it_works() {
        assert_eq!(4, add_two(2));
    }
}


/// This function adds two to its argument.
///
/// # Examples
///
/// ```
/// use adder::add_two;
///
/// assert_eq!(4, add_two(2));
/// ```
pub fn add_two(a: i32) -> i32 {
    a + 2
}

#[cfg(test)]
mod tests2 {
    use super::*; //glob feature
    use test::Bencher;
    use test;

    #[test]
    fn it_works() {
        assert_eq!(4, add_two(2));
    }

    #[bench]
    fn bench_add_two(b: &mut Bencher) {
        b.iter(|| add_two(2));
        b.iter(|| {
            let mut n = 1000_u32;
            test::black_box(&mut n); // pretend to modify `n`
            range(0, n).fold(0, |a, b| a ^ b)
        })
    }
}

