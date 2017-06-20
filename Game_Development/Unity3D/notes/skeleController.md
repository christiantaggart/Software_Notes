# Skeleton Controller

- Player controller for Skeleton obj

- Several animations mapped to events


File: **skeleController.cs**

```cs
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class skeleController : MonoBehaviour {

	// The Rigidbody component
	private Rigidbody rb;


	private Animation anim;


	void Start () {
		//Creating reference so this wont need to be called on every frame in (Update)
		rb = GetComponent<Rigidbody> ();

		anim = GetComponent<Animation> ();

	}


	void Update () {

		// Gets a value between -1 & 1 for each
		float x = CrossPlatformInputManager.GetAxis ("Horizontal");
		float y = CrossPlatformInputManager.GetAxis ("Vertical");

		// SETTING 2D MOVEMENT OF JOYSTICK TO 3D MOVEMENT
		// X is set as x
		// Y is set to 0 because we are not moving up and down
		// Z is set as the Y
		Vector3 movement = new Vector3(x, 0, y);


		// THIS IS SPEED THAT OBJECT WILL MOVE
		// CHANGE IF YOU WANT TO INCREASE/DECREASE SPEED
		rb.velocity = movement * 45f;


		// FACE DIRECTION THE JOYSTICK IS POINTED
		if (x != 0 && y != 0) {
			transform.eulerAngles = new Vector3 (transform.eulerAngles.x, Mathf.Atan2(x,y) * Mathf.Rad2Deg, transform.eulerAngles.z);
		}


		// JOYSTICK IS BEING MOVED ANIMATE "Walk01" OTHERWISE "Idle" ANIMATION IS PLAYED
		if (x != 0 || y != 0) {
			anim.Play ("Walk01");
		} else {
			anim.Play ("Idle");
		}


		if(CrossPlatformInputManager.GetButtonDown ("JumpButton")){
			Debug.Log ("jump");
			anim.Play ("BeginJump");
		}
	}
}

```
