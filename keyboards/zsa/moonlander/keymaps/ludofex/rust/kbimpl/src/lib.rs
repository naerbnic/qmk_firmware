#![no_std]

#[panic_handler]
fn panic_handler(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn test_func(i: i32) -> i32 {
    i + i * 2
}
#[no_mangle]
pub extern "C" fn test_func2(i: i32) -> i32 {
    i + i * 3
}
