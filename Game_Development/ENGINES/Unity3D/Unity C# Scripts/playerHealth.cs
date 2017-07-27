 using UnityEngine;
 using System.Collections;

 public class PlayerHealth : MonoBehaviour {

     public float health;

    //A simple way to do this:

     public int hitCount = 3; //number of hits
     public float hitTime = 2; //time in seconds between each hit
     float curTime = 0; //time in seconds since last hit


     // Use this for initialization
     void Start () {

     }

     // Update is called once per frame
     void Update () {

        //  if (health < 0f)
        //  {
        //      EnemyAI.isPlayerAlive = false;
        //      Destroy (gameObject);
        //  }

         if (hitCount > 0) //if there are more hits left
         {
             curTime += Time.deltaTime; //add time
         }

     }
 }
