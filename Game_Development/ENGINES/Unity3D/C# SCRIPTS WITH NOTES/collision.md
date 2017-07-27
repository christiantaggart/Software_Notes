# Collision

#### Features:
- Explosion Animation "FlareMobile"
- Loads new enemies after all enemies have been destroyed

File: **collision.cs**

```cs
using UnityEngine;
using System.Collections;

public class collision : MonoBehaviour {

	// Use this for initialization
	void Start () {

	}

	// Update is called once per frame
	void Update () {

	}

	//for this to work both need colliders, one must have rigid body (spaceship) the other must have is trigger checked.
	void OnTriggerEnter (Collider col){
		// EXPLOSION ANIMATION
		GameObject explosion = Instantiate(Resources.Load("FlareMobile", typeof(GameObject))) as GameObject;
		explosion.transform.position = transform.position;

		// DESTROYS 'col' AKA OBJECT HIT BY COLLISION
		Destroy(col.gameObject);

		//PLAYS ANIMATION 'explosion'
		Destroy (explosion, 2);

		// IF ALL ENEMIES ARE DESTROYED LOAD MORE ENEMIES
		if (GameObject.FindGameObjectsWithTag("Player").Length == 0){

			GameObject enemy = Instantiate(Resources.Load("enemy", typeof(GameObject))) as GameObject;
			GameObject enemy1 = Instantiate(Resources.Load("enemy1", typeof(GameObject))) as GameObject;
			GameObject enemy2 = Instantiate(Resources.Load("enemy2", typeof(GameObject))) as GameObject;
			GameObject enemy3 = Instantiate(Resources.Load("enemy3", typeof(GameObject))) as GameObject;

		}

		Destroy (gameObject);


	}

}
```
