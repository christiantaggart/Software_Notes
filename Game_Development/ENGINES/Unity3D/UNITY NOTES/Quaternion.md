Mostly stolen straight from the docs just reformatted them for myself.
## Quaternion:
- **[Stolen from Unity DOCS](https://docs.unity3d.com/ScriptReference/Quaternion.html)**  
- **[Examples explaining Quaternions (Definition portion)](https://luckytoilet.wordpress.com/2014/11/24/visualizing-quaternions-with-unity/)**

**Quaternions are used to represent rotations.**

They are compact, don't suffer from **gimbal lock** _(lose a dimension of rotation)_ and can easily be interpolated.

- Unity internally uses Quaternions to represent all rotations.

They are based on complex numbers and are not easy to understand intuitively.
You almost never access or modify individual Quaternion components (x,y,z,w); most often you would just take existing rotations (e.g. from the Transform) and use them to construct new rotations (e.g. to smoothly interpolate between two rotations).

### Commonly used Quaternion functions:

- **[Quaternion.LookRotation](https://docs.unity3d.com/ScriptReference/Quaternion.LookRotation.html)**
  ``` cs
  // SYNTAX
  public static Quaternion LookRotation(Vector3 forward, Vector3 upwards = Vector3.up);
  // EXAMPLE
  public Transform target;
  void Update() {
      Vector3 relativePos = target.position - transform.position;
      Quaternion rotation = Quaternion.LookRotation(relativePos);
      transform.rotation = rotation;
  }
  ```
  - Creates a rotation with the specified forward and upwards directions.
    - Parameters:
    `forward`	The direction to look in.
    `upwards`	The vector that defines in which direction up is.
  - Returns the computed quaternion.
    - If used to orient a Transform, the Z axis will be aligned with forward/ and the Y axis with upwards if these vectors are orthogonal (Right angles).
    - Logs an error if the forward direction is zero.
- **[Quaternion.Angle](https://docs.unity3d.com/ScriptReference/Quaternion.Angle.html)**
  ```cs
  // SYNTAX
  public static float Angle(Quaternion a, Quaternion b);
  //EXAMPLE
  public Transform target;
     void Update() {
         float angle = Quaternion.Angle(transform.rotation, target.rotation);
     }
  ```
  - Returns the angle in degrees between two rotations a and b.

- **[Quaternion.Euler](https://docs.unity3d.com/ScriptReference/Quaternion.Euler.html)**
  ```cs
  // SYNTAX
  public static Quaternion Euler(float x, float y, float z);
  //EXAMPLE
   public Quaternion rotation = Quaternion.Euler(0, 30, 0);

  // SYNTAX
  public static Quaternion Euler(Vector3 euler);
  // EXAMPLE
  public Quaternion rotation = Quaternion.Euler(new Vector3(0, 30, 0));
  ```
  - Returns a rotation that rotates z degrees around the z axis, x degrees around the x axis, and y degrees around the y axis (in that order).

- **[Quaternion.Slerp](https://docs.unity3d.com/ScriptReference/Quaternion.Slerp.html)**
  ```cs
  // SYNTAX
  public static Quaternion Slerp(Quaternion a, Quaternion b, float t);
  // EXAMPLE
  public Transform from;
     public Transform to;
     public float speed = 0.1F;
     void Update() {
         transform.rotation = Quaternion.Slerp(from.rotation, to.rotation, Time.time * speed);
     }
  ```
  - Spherically interpolates between a and b by t
  - The parameter t is clamped to the range [0, 1]

- **[Quaternion.FromToRotation](https://docs.unity3d.com/ScriptReference/Quaternion.FromToRotation.html)**
  ```cs
  // SYNATAX
  public static Quaternion FromToRotation(Vector3 fromDirection, Vector3 toDirection);
  // EXAMPLE
  void Example() {
         transform.rotation = Quaternion.FromToRotation(Vector3.up, transform.forward);
     }
  ```
  - Creates a rotation which rotates from fromDirection to toDirection.
  - Use this to rotate a transform so that one of its axes eg. the y-axis - follows a target direction toDirection in world space.

- **[Quaternion.identity](https://docs.unity3d.com/ScriptReference/Quaternion-identity.html)**
  ```cs
  //SYNTAX
  public static Quaternion identity;
  // EXAMPLE
  void Example() {
    transform.rotation = Quaternion.identity;
  }
  ```
  - The identity rotation (Read Only).
  - This quaternion corresponds to "no rotation" - the object is perfectly aligned with the world or parent axes.





#### Definition
A quaternion is an ordered pair of 4 real numbers **(w,x,y,z)**
Written as:
**w+xi+yj+zk**
- The letters **i, j, k** are independent axes.
- Think quaternions as a 4 dimensional vector space.

The defining property of quaternions is:
**i^2 = j^2 = k^2 = ijk = -1**
