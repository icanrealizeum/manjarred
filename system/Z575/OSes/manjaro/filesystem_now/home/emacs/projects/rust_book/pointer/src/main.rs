fn main() {
    println!("Hello, world!");
    let x = 5;
    let y = 8;
    let z = &y;
    if *z == y {
        println!("{:p} {} {}",z,*z, z);
    }

    let mut i: i32 = 1;
    //    foo(&mut i);//error: cannot borrow immutable borrowed content `*z` as mutable
    let z=&mut i;
    foo(z);//error: cannot borrow immutable borrowed content `*z` as mutable
    println!("{} {}",*z,z);

    //reference:
    let x = 5;
    let y = &x;

    println!("{}", *y);
    println!("{:p}", y);
    println!("{}", y);//because println! will automatically dereference it for us.

    let x = 5;
    let y = &x;
    println!("{}", succ(y));
    println!("{}", succ(&x));
    println!("{}", x);//unchanged


    let mut x = 5;
    let y = &mut x;


    let x = 5;
    let y = &x;
    let z = &x;

    let mut x = 5;
    let y = &mut x;
    //    let z = &mut x; // error: cannot borrow `x` as mutable more than once at a time

    //boxes:
    let x = Box::new(5);//Boxes are appropriate to use in two situations: Recursive data structures, and occasionally, when returning data.
    println!("{}", succ(&*x));
    println!("{}", succ(&*x));
    println!("{}", succ(&*x));

    //recursive data structure
    let list: List<i32> = List::Cons(1, Box::new(List::Cons(2, Box::new(List::Cons(3, Box::new(List::Nil))))));
    println!("{:?}", list);


    let x = &mut 5;
    if *x < 10 {
        let y = &x; // uhm https://github.com/rust-lang/rust/issues/21575
        println!("Oh no: {} {:p}", y,y);
        println!("Oh no: {} {:p}", x,x);
        //*y=&mut 6;
    }
    println!("Oh no: {} {:p}", x,x);
    *x -= 1;
    println!("Oh no: {} {:p}", x,x);
}//main //Box::new freed here

#[derive(Show)]
enum List<T> {
    Cons(T, Box<List<T>>),
    //The reference to another List inside of the Cons enum variant must be a box, because we don't
    //know the length of the list. Because we don't know the length, we don't know the size, and
    //therefore, we need to heap allocate our list.
    //Working with recursive or other unknown-sized data structures is the primary use-case for boxes.
    Nil,
}



fn foo(x: &mut i32) {
    *x = 5
}

fn succ(x: &i32) -> i32 { *x + 1 }

fn realsucc(x: i32) -> i32 { x + 1 }

