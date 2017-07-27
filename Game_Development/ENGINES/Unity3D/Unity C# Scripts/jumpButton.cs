using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

// File: 'jumpScript.cs'
public class jumpScript : MonoBehaviour, IVirtualButtonEventHandler {


	// Creating reference to the virtual button game object
	private GameObject jumpButtonObject;

	// Creating reference to the skeleton_animated game object
	private GameObject skeleton_animated;

	// Use this for initialization
	void Start () {

		// Finds virtual button object named jumpButton
		jumpButtonObject = GameObject.Find ("jumpButton");


		// FINDS skeleton_animated OBJECT NAMED skeleton_animated
		skeleton_animated = GameObject.Find ("skeleton_animated");


		// REGISTER EVENT HANDLER WITH VIRTUAL BUTTON OBJECT
		jumpButtonObject.GetComponent<VirtualButtonBehaviour>().RegisterEventHandler (this);
	}


	// REGISTERS BUTTON CLICK AND ALLOWS ADDITION OF BEHAVIOR
	public void OnButtonPressed (VirtualButtonAbstractBehaviour jump){

		// SIMPLE LOG TO UNITY CONSOLE TO SHOW BUTTON BEING PRESSED
		Debug.Log ("*******JUMP");

		// USING skeleton_animated OBJECTS Animation ON BUTTON CLICK/HOLD
		skeleton_animated.GetComponent<Animation> ().Play("BeginJump");
		skeleton_animated.GetComponent<Animation> ().PlayQueued("JumpLoop");
		skeleton_animated.GetComponent<Animation> ().PlayQueued("LandFromJump");

	}

	// REGISTERS BUTTON RELEASE AND ALLOWS ADDITION OF BEHAVIOR
	public void OnButtonReleased (VirtualButtonAbstractBehaviour jump){

		// SIMPLE LOG TO UNITY CONSOLE ONCE jump HAS BEEN RELESAED
		Debug.Log ("JUMP******");


		// ENDS ANIMATION ONCE jump HAS BEEN RELEASED
    // skeleton_animated.GetComponent<Animation> ().Stop ();
		skeleton_animated.GetComponent<Animation> ().PlayQueued("Idle");

	}
}
