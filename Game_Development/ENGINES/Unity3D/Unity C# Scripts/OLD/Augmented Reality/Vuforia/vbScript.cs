using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;


// FILE IS NAMED vbScript.cs
public class vbScript : MonoBehaviour, IVirtualButtonEventHandler {

	// Creating reference to the virtual button game object
	private GameObject vbButtonObject;


  // THIS IS REFERRING TO MY 3D-OBJECT IN THE GAME
	// Creating reference to the skeleton_animated game object
	private GameObject skeleton_animated;



	// Use this for initialization
	void Start () {

		// Finds virtual button(Vuforia PREFAB) object named 'actionButton'
		vbButtonObject = GameObject.Find ("actionButton");

		// FINDS skeleton_animated OBJECT NAMED skeleton_animated
		skeleton_animated = GameObject.Find ("skeleton_animated");


		// REGISTER EVENT HANDLER WITH VIRTUAL BUTTON OBJECT
		vbButtonObject.GetComponent<VirtualButtonBehaviour>().RegisterEventHandler (this);

	} // End Start()



	// REGISTERS BUTTON CLICK AND ALLOWS ADDITION OF BEHAVIOR
	public void OnButtonPressed (VirtualButtonAbstractBehaviour vb){

		// LOG TO UNITY CONSOLE TO SHOW BUTTON BEING PRESSED
		Debug.Log (" ~~~~~~~PUSH");

		// USING skeleton_animated OBJECTS Animation ON BUTTON CLICK/HOLD
    // Play starts the animation immediately
		skeleton_animated.GetComponent<Animation> ().Play ("Walk01");

    // PlayQueued sets this animation to play after the first one has finished
		skeleton_animated.GetComponent<Animation> ().PlayQueued ("Walk02");

	} // End OnButtonPressed()





	// REGISTERS BUTTON RELEASE AND ALLOWS ADDITION OF BEHAVIOR
	public void OnButtonReleased (VirtualButtonAbstractBehaviour vb){

		// SIMPLE LOG TO UNITY CONSOLE ONCE vb HAS BEEN RELESAED
		Debug.Log ("PUSH~~~~~~~~");

		// ENDS ANIMATION ONCE vb HAS BEEN RELEASED
		skeleton_animated.GetComponent<Animation> ().Stop ();

    // Plays "Idle2" After previous animations have stoped
		skeleton_animated.GetComponent<Animation> ().PlayQueued("Idle2");

	} // END OnButtonReleased()
}
