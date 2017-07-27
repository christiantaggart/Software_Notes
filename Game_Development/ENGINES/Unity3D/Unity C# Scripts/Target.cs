using UnityEngine;

public class Target : MonoBehaviour {

	// the ammount of health anything with the Target script has.
	public float health = 50f;
	private Animation anim;
	// a prefab that will be instantied (dropped) when an entity with the Target script has reached 0 health.
	// The ammopickup add ammo to the clients inventory
	public GameObject ammopickup;

	void Start () {
		anim = GetComponent<Animation> ();

		Physics.gravity = new Vector3(0, -100.0F, 0);

		// IF THERE ARE LESS THAN 6 ENEMIES (Enemies are tagged with Player) instantiate (spawn) untill total number == 5
		if (GameObject.FindGameObjectsWithTag ("Player").Length < 6) {
			// z1 is the name of my animated zombie prefab
			Instantiate (Resources.Load ("Prefabs/z1", typeof (GameObject)));
			Spawn ();
		}
	}

	//	WHEN SHOT REMOVE HEALTH
	public void TakeDamage (float ammount) {
		health -= ammount;
		// When TakeDamage 'hit' play this animation
		anim.Play ("back_fall");

		if (health <= 0f) {
			// Once health reaches 0 or less call Die function
			Die ();
		}
	}


	//	DIE FUNCTION
	void Die () {
		// Removes z1 (animated zombie enemy)
		Destroy (gameObject);
		// Spawn function is called. Spawns a zombie at a random position within a certain rainge (map size or certain area of map)
		Spawn ();
		// Creating a random spot to spawn the ammo pickup defined as 'position'
		Vector3 position = new Vector3 (Random.Range (-30F, 64.0F), 0f, Random.Range (-30.0F, 64.0F));

		// If there are currently more than 3 ammopickups (ammo crates) don't do spawn another
		if (GameObject.FindGameObjectsWithTag ("ammopickup").Length > 3) {
		// The commented out line below finds the current ammount of 'ammopickup' in game when the Die funcion is called
	  // Debug.Log (GameObject.FindGameObjectsWithTag ("ammopickup").Length);
			return;

		} else {
			// If there are less than 3 'ammopickup' (ammorates) instantiate one (spawn) at a random position
			// I later changed this to Transform.Position to drop the 'ammopickup' at the place the zombie was killed
			Instantiate (Resources.Load ("Prefabs/ammopickup", typeof(GameObject)), position, Quaternion.identity);
		}
	}


	// RANDOM POSITION TO SPAWN Zombie game objects (Named "z1")
	void Spawn () {
		Vector3 position = new Vector3 (Random.Range (-30F, 64.0F), 0.5f, Random.Range (-30.0F, 64.0F));
		Instantiate (Resources.Load ("Prefabs/z1", typeof (GameObject)), position, Quaternion.identity);

	}

}
