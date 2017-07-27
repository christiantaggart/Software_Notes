// USED FOR GUN FUNCTIONALITY
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityStandardAssets.CrossPlatformInput;
using UnityEngine.UI;

public class Gun : MonoBehaviour {

	// GUN STATS
	public float damage = 10f;
	public float range = 300f;
	public float impactForce = 200f;
	public int fireRate = 9;
	public int bullets = 120;
	public int bulletsLeft = 0;



	// RAY CAST WITH Camera
	public Camera fpsCam;

	// muzzleflash (Created with particle system)
	public ParticleSystem muzzleFlash;

	// impactEffect (Created with particle system)
	public GameObject impactEffect;

	// HOLDS CURRENT ROUNDS FIRED THIS SECOND VALUE
	private float nextTimeToFire = 0f;

	// SIMPLE NAME TO CALL ANIMATIONS ON EVENTS
	private Animation anim;

	// SOUND
	public AudioSource suppressedSound;



	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI	//    GUI

	// SCORE SHOWN IN GUI
	public int score;

	public Text GUI_Score;

	// HEALTH LEFT GUI
	public int Health = 100;

	public Text GUI_Health;

	// AMMO LEFT SHOWN IN GUI
	public Text GUI_Ammo;

	//GUI SCREEN
	public Image gameover;

	//
	public GameObject ammopickup;
	public GameObject GUI_AMMOPICKUP;
	public float time = 5f; //Seconds to read the text


	void Start () {

		anim = GetComponent<Animation> ();
		suppressedSound = GetComponent<AudioSource> ();
		score = 0;
		gameover.gameObject.SetActive (false);
		GUI_AMMOPICKUP.gameObject.SetActive (false);
	}






	void Update () {

		GUI_Health.text = (Health.ToString()  + "%");
		if (Health <= 0) {
			Debug.Log ("You DIED!");

			gameover.gameObject.SetActive (true);



			Time.timeScale = 0;

		};


		// ADD "Down" TO GetButton TO MAKE SEMI AUTO
		// CHANGE Input TO CrossPlatformInput if using mobile
		if (Input.GetButton ("Fire1") && Time.time >= nextTimeToFire) {

			if (bulletsLeft >= 0) {

				//Shooting Animation PLAYS WHEN SHOOT BUTTON PRESSED
				anim.Play ("hipfire");

				// KEEPS TRACK OF ROF
				nextTimeToFire = Time.time + 1f / fireRate;

				// CALLS Shoot FUNCTION
				Shoot ();

				suppressedSound.enabled = true;
				// suppressedSound.loop = true;
				suppressedSound.Play ();

			} // BULLETSLEFT CONDITIONAL

			else {
				suppressedSound.enabled = false;
				// suppressedSound.loop = false;

			}

		}
	}


	void Shoot () {



		// ADDS muzzleFlash PARTICLE SYSTEM EFFECT WHEN SHOOT IS CALLED
		muzzleFlash.Play ();

		RaycastHit hit;

		if (Physics.Raycast (fpsCam.transform.position, fpsCam.transform.forward, out hit, range)) {

			// ASSIGNING target TO OBJECTS WITH TARGET SCRIPT
			Target target = hit.transform.GetComponent<Target> ();

			// IF target has TARGET SCRIPT ADD DAMAGE
			if (target != null) {

				target.TakeDamage (damage);

			}

			if (hit.rigidbody != null) {

				hit.rigidbody.AddForce (-hit.normal * impactForce);


			}

			GameObject impactGO = Instantiate (impactEffect, hit.point, Quaternion.LookRotation (hit.normal));

			Destroy (impactGO, 2f);
		}

		updateBullets ();
	} // END SHOOT



	void updateBullets (){

		// KEEPING TRACK OF BULLETS FIRED/ LEFT
		bulletsLeft = bullets -= 1;

		// ADDING BULLET COUNT TO UI
		GUI_Ammo.text = bulletsLeft.ToString();


	} // END updateBullets

	void OnTriggerEnter(Collider col){
		//It will check for the name of the GameObject that had enter inside the enemy trigger
		if(col.gameObject.name == "ammopickup"){
			//Inside this if you will have the confirmation that the player is being hit by the enemy
			Debug.Log("ammopickup");
			bullets += 120;
			bulletsLeft += 120;
			updateBullets ();
			DestroyImmediate (ammopickup, true);
			GUI_AMMOPICKUP.gameObject.SetActive (true);
//			Destroy (GUI_AMMOPICKUP, true);

			if(gameObject.tag == "Player"){
				score += 50;//increments score
				Debug.Log("SCORE UP");
				GUI_Score.text = score.ToString();
			}
		}
	}



}
