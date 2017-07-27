// USED FOR PICKING UP AMMO DROPS FROM KILLING ENEMIES

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ammopickup : MonoBehaviour {

	// Use this for initialization

	void OnTriggerEnter(Collider mainCharacter){
		//It will check for the name of the GameObject that had enter inside the enemy trigger
		if(mainCharacter.gameObject.name == "body"){
			(mainCharacter.gameObject.GetComponent("Gun")as Gun).bulletsLeft += 120;

		}
	}

}
