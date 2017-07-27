# Enemy Script

#### Features:
- Automatic 'Move'
- attached to enemy Objects to emulate AI

File: **enemyScript.cs**

```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyScript : MonoBehaviour {



	// Use this for initialization
	void Start () {

		// FUNCTION DEFINED BELOW
		StartCoroutine ("Move");
	}

	// Update is called once per frame
	void Update () {

		// MOVE FORWARD AT A CONSTANT SPEED
		transform.Translate(Vector3.forward * 3f * Time.deltaTime);
	}

	IEnumerator Move() {

		// WILL CONTINUE WHILE MOVING
		while (true) {
			yield return new WaitForSeconds (3.5f);
			transform.eulerAngles += new Vector3 (0, 180f, 0);
		}
	}
}
```
