# Rust

[Docs: Rust Book](https://doc.rust-lang.org/book/2018-edition/index.html)
[Cheat Sheet](https://learnxinyminutes.com/docs/rust/)

- Key
- **$** indicates CLI

## Initial Setup (MacOS / Linux)

- **Install** **$** `curl https://sh.rustup.rs -sSf | sh`
- **Verify** rustup install **$** `rustup -V`  
  - To **Update** rustup **$** `rustup update`
  - To **Uninstall** rustup **$** `rustup self uninstall`
- **Verify** rust version **$** `rustc -V`

### Creating a Rust Program

- Create a directory to house source and compiled files
  - Bash: **$** `mkdir rust_stuff && cd rust_stuff`
  - Zshell: **$** `take rust_stuff`
- Create Source File
  - **$** `touch rusty_bucket.rs`
    - Then paste the following in **rusty_bucket.rs**:
        ```rust
        fn main() {
            println!("Hello, world!");
        }
        ```
  - **Or** create and populate the file (**rusty_bucket.rs**) all in one command: **$**
    ```sh
    cat << 'ENDER' > rusty_bucket.rs
    fn main() {
        println!("Hello, world!");
    }
    ENDER
    ```

- Compile the source file
  - **$** `rustc rusty_bucket.rs`
- Execute the program after compiling
  - **$** `./rusty_bucket`
