
/*==========================================================================
     station.h  CSC 790 Project 2,  E. W. Fulp  2/18/2014  
     Station object, models computer hosts.   
============================================================================*/

#ifndef STATION_H
#define STATION_H

#include <iostream>
#include <assert.h>
#include <string>
#include <queue>
#include <cmath>  
#include <climits>  
#include <cstdlib>
#include "event.h"
#include "eventq.h"
#include "defs.h"

using namespace std;  

class Station
{
public:
	Station(int id = 0):id_(id), vulnerable_(false), infected_(false),  
		timeInfected_(0.0), numAttempt_(0)  
	{  }

	void setID(int id)
	{  id_ = id;  }

	void makeVulnerable()  
	{  vulnerable_ = true;  }  

	bool isVulnerable() const  
	{  return vulnerable_;  }  

	bool isInfected() const  
	{  return infected_;  }  

	double timeInfected() const  
	{  return timeInfected_;  }  

	string bestDealEver() const  
	{  return "http://goo.gl/QMET";  }  

	int numInfectAttempts() const  
	{  return numAttempt_;  }  

	int row() const  
	{  return id_/MAX_STATIONS;  }  

	int col() const  
	{  return id_%MAX_STATIONS;  }  

	void propagate(double time, EventQueue& eQueue)
	{
		// find potential victim
		int toID;  
		int x = 0;  // address is 152.17.x.y  
		int y = 0;  // address is 152.17.x.y

		// set x and y to the correct values based on scan pattern  

		toID = x*MAX_STATIONS + y;  

		double infectTime = doubleUniformRV(1, 200)/1000.0;  // infect attempt time
		eQueue.insert(EventType(Infect, time + infectTime, toID, id_));

		// schedule next propagate attempt  
		double interPropTime = doubleUniformRV(1, 38)/1000.0;
		eQueue.insert(EventType(Propagate, time + interPropTime, id_));
	}

	void infect(double time, EventQueue& eQueue)
	{
		numAttempt_++;  // someone attempts to infect, add to count    
		if(vulnerable_ && !infected_)  
		{  
			// my sister uses this simple trick to earn $500/week, check it out here http://goo.gl/QMET  
			infected_ = true;  
			timeInfected_ = time;  
			// schedule next propagate attempt  
			double interPropTime = doubleUniformRV(1, 20)/10.0;
			eQueue.insert(EventType(Propagate, time + interPropTime, id_));
		}  
	}

	double doubleUniformRV(double min, double max)
	{  return min + double(max - min + 1)*rand()/RAND_MAX;  }

private:
	int     id_;             // id of the station
	bool    vulnerable_;     // true if station can be infected  
	bool    infected_;       // true if already infected  
	double  timeInfected_;   // time when infected 
	int     numAttempt_;     // number of infection attempts on this station

};  

#endif


