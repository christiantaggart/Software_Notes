using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class scenecontroller : MonoBehaviour {


	private GameObject body;



	// Pass in sting name of new scene
	public void NewGameBtn (string newGameLevel){

		SceneManager.LoadScene (newGameLevel);
	}

	public void gameover (string dead){
		if ((body.gameObject.GetComponent("Gun")as Gun).Health < 0) {
			SceneManager.LoadScene (dead);
		}
	}

	// Pass in sting name of new scene
	public void ExitGameBtn (string mainmenu){

		SceneManager.LoadScene (mainmenu);
	}

	void start () {
		body = GameObject.Find ("body");

	}

	void update() {
		if (Input.GetKey(KeyCode.Delete)) {
			SceneManager.LoadScene ("MENU");
			return;
		}

	}



}
