# Write to file

- To Over Write All use one `>`
  - $ `echo "hello" > file_to_append_to`
- To Append use two `>`
  - $ `echo "world" >> file_to_append_to`
- Examples:
  - $ `echo "hello" > file_to_append_to`
  - $ `echo "world" >> file_to_append_to`
    - If **file_to_append_to** does not exist, it will be created.

---

## Write to file (Ignore Escape Characters) heredoc

[heredoc wiki](https://en.wikipedia.org/wiki/Here_document)
[heredoc StackOverflow](https://stackoverflow.com/questions/45047380/write-text-to-file-literally-including-special-characters)

- A here document is a special-purpose code block. It uses a form of I/O redirection to feed a command list to an interactive program or a command, such as ftp, cat, or the ex text editor. [_Source_: TLDR](https://www.tldp.org/LDP/abs/html/here-docs.html)
- The Method below (heredoc) ignores escape characters: [_Source_: StackOverFlow](https://stackoverflow.com/questions/45047380/write-text-to-file-literally-including-special-characters)
  - ```sh
    at << 'ENDER' > /path/to/file
    Thi$ is text with ' " special chars
    that [ spans ] {} multiple lines
    ENDER
    ```
    - Note that the string "ENDER" is completely arbitrary, and if you want a line in the output that consists only of the string EOT, you can choose a different delimiter. You can also stack the here docs, so if you want some variables to be interpolated you can do something like:
      - ```sh
        { cat << 'ENDER'; cat << EOF; } > /path/to/file
        This $var will not be interpolated in the output
        ENDER
        But this $var will!
        EOF
        ```