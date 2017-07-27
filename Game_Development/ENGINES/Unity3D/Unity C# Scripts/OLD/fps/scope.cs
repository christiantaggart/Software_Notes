// FOR AIM DOWN SIGHT
// TUTORIAL https://www.youtube.com/watch?v=adcKX1c-kag

// USE ANIMATOR AND ANIMAIONS TO CREATE CLIPS
// USE ANIMATOR CONTROLLER AND SET PARAMETER "Scoped"
// CREATE SCOPE CROSSHAIR IMG (SPRITE)
// MAKE IT ACTIVATE WHEN isScoped
// @ around 20mins watch for layers

!!!!!!!!!!!!NOT COMPLETE!!!!!!!!!!!!!

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scope : MonoBehaviour {

  public Animator animator;

  // SCOPE CROSSHAIR SPRITE
  public GameObject scopeOverlay;


  public GameObject weaponCamera;

  // SETTING / CHECKING STATE OF ADS
  private bool isScoped = false;


  void Update()
  {
    // BUTTON HANDLER FOR aimDownSight (OR WHAT EVER I CALL IT)
    if (CrossPlatformInput.GetButtonDown("aimDownSight")){


      // Setting isScoped to true
      isScoped = !isScoped;

      // "Scoped" == SAME NAME AS SET IN ANIMATOR BOOL PARAMETER
      animator.SetBool("Scoped", isScoped);

      // scopeOverlay.SetActive(isScoped);




      // ADDING DELAY TO CROSSHAIR SPRITE IMG RENDERING
      if(isScoped)
        StartCoRoutine(OnScoped());
      else
        OnUnscoped();


    } // END IF
  } // END UPDATE


  // FUNCTIONALITY TO DELAY CROSSHAIR SPRITE RENDER
  void OnUnscoped ()
  {
    scopeOverlay.SetActive(false);

    // SHOW WEAPON WHEN UNSCOPED
    weaponCamera.SetActive(true);
  }


  IEnumerator OnUnscoped()
  {
    yield return new WaitForSeconds(.15f);
    scopeOverlay.SetActive(true);

    // HIDE WEAPON WHEN SCOPED IN
    weaponCamera.SetActive(false);

  }

}
