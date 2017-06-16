# Cryptography:

- Cryptography's definition is the study of codes

---
## Specifics on Cryptography:
[Lifetimes of Hash Functions](http://valerieaurora.org/hash.html)
- cypher takes message and encodes key (hashing algorithm)
- blowfish ([hashing algorithm](https://www.schneier.com/academic/blowfish/))
(Diagram of how blowfish hashes)
<img src="/Blowfish_diagram.png" alt="Drawing" style="width: 300px;"/>
  - Bcrypt uses blowfish
  - cost, salt, key
- **Cost:**
  - specifies a key expansion iteration count as a power of two, which is an input to the crypt algorithm.

- **Salt**
  - 128-bit (base-64 encoded as 22 characters)
  - added layer of encryption cypher

---

#### Methods of attack
  - dictionary file (log of every possible bruteforce hashed answers)
    - bruteforce Methods:
      - determine if hashing algorithm is static (same for every hash)

---

#### Security things to consider && ||  keep in mind
Cost(My-website/ data/ users) >= Cost(hacking)
- Cost + Time (layers of security && time spent trying to break it, paying specialists to try an break it)

**Asks:**
- How much is the site worth?
  - how long to crack encryption
    - how long would it take to dedicate a machine to break it
    - cost of machine
  - ad rev, user-base, marketability, movement, content, niche env

- If a part of the site is compromised, what trickles down
  - what parts of data are compromised?
    - How useful/ harmful/ vulnerable is this.data?

---

#### How to protect user-base:
- encrypt passwords instead of plain-text
  - Best encryption for application

---

#### Server vulnerabilities/ possibility of attack
- check for sql injections
  - can copy everything from server and copy everything to their own (capture all the datas)
- Security set up:
  - delegate/ parse out applications access to other sections of data (used to separate concerns/ section off vulnerable areas)

---

#### Certificates:
- Validate that you are legitimate server
- What creates HTTPS(secure)

#### Man in the middle:
- Set up server to pretend to be desired route client
  - Intercept all data to that route

#### SIDE NOTES
  - Server log to check client ip addy
