fn twice<T: Add<T>>(v: T) -> Add<T>::Output{
        v+v
}

fn main()
{
}
