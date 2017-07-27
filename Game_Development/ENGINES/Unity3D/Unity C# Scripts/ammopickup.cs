// THIS SCRIPT IS USED TO ADD AMMO WHEN CLIENT COLLIDES WITH THE AMMOCRATE "ammopickup" THAT IS DROPPED BY KILLING A ZOMBIE
// IT ADDS 120 BULLETS TO THE CLIENTS INVENTORY

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ammopickup : MonoBehaviour {

	// Use this for initialization

	void OnTriggerEnter(Collider mainCharacter){
		//It will check for the name of the GameObject that had enter inside the enemy trigger
		if(mainCharacter.gameObject.name == "body"){

      // GUN == the name of a script on my body element containing all the guns stats (bullets, etc)
			(mainCharacter.gameObject.GetComponent("Gun")as Gun).bulletsLeft += 120;
			if (mainCharacter.gameObject.name == "body") {
				// This removes the ammo crate after the client collides with it
				Destroy (gameObject);
			}
		}

	}

}
