fn main() {
    let original:f64=15.0;//value seems irrelevant (take 1% 459 times to get down to 1%)
    let percent_to_take:f64=1.;//take this % of original until it's:
    let target_percent:f64=0.0;//down to % of the original value
    //TODO: use 0.0 ^ and make the below if work, also this: http://floating-point-gui.de/

    let mut total:f64 = original;
    let mut count=0;
    let mut taken_value;
    let cached_target=target_percent*original/100.;

/*    let mut a=0.0;
    let b:f64=target_percent*original/100.;
    loop {
        if a <= b {
            break;
        }*/
    loop {
        if total as f64 <= cached_target as f64 {
            break;
        }
        taken_value=total * percent_to_take/100.;
        total-=taken_value;
        count+=1;
        println!("[{}] {} {} target={}", count, total, taken_value, cached_target);
        if count>1715 {
            break;
        }
    }
    println!("Takes {} times to take {}% from initial value of {} to get it down to {} which is {}%(that is: {})",
             count, percent_to_take, original, total, target_percent, cached_target);
}
