using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemy : MonoBehaviour {

	//The target player
	public Transform player;

	//At what distance will the enemy walk towards the player?
	public float walkingDistance = 100.0f;

	//In what time will the enemy complete the journey between its position and the players position
	public float smoothTime = 2.30f;

	//Vector3 used to store the velocity of the enemy
	private Vector3 smoothVelocity = Vector3.zero;

	// The Rigidbody component
	//	private Rigidbody rb;


	private Animation anim;

	// Use this for initialization
	void Start () {
		//Creating reference so this wont need to be called on every frame in (Update)
	 // rb = GetComponent<Rigidbody> ();

		anim = GetComponent<Animation> ();
	}

//	void OnCollisionEnter (Collision col){
//		if(col.gameObject.tag == "Player"){
//			anim.Play ("attack");
//			Destroy(col.gameObject);
//			Debug.Log ("DEAD");
//		}
//	}
//
	//Call every frame
	void Update() {

		//Look at the player
		transform.LookAt(player);

		//Calculate distance between player
		float distance = Vector3.Distance(transform.position, player.position);

		//If the distance is smaller than the walkingDistance
		if (distance < walkingDistance) {

			anim.Play ("walk");
			//Move the enemy towards the player with smoothdamp
			transform.position = Vector3.SmoothDamp (transform.position, player.position, ref smoothVelocity, smoothTime);
		} else {
			anim.Play ("Idle2");
		}

		if (distance < 1f) {
			anim.Play ("attack");

		}
	}
}
