
/*==========================================================================
     driver.cpp  CSC 790 Project 2,  E. W. Fulp  2/18/2014  
     Worm discrete event simulator main function.  
============================================================================*/

#include <iostream>
#include "defs.h"
#include "eventq.h"
#include "station.h"

void writeStats(fstream& dataFile, double time, int numInfected);  
void writeInfectionAttempts(Station* s);  

void clearScreen();  
bool allInfected(Station* s);  
void displayNetwork(Station* s);  


int main()
{
	double time     = 0.0;
	int numInfected = 0;

	fstream dataFile("data.dat", ios::out);  

	Station s[MAX_STATIONS*MAX_STATIONS];  // 152.17.x.y stations  
	for(int i = 0; i < MAX_STATIONS*MAX_STATIONS; i++)  
	{
		s[i].setID(i);  
		// only 25% should be vulnerable  
		if(double(rand())/INT_MAX <= 0.25)  
		s[i].makeVulnerable();  
	}

	EventQueue eventQueue;
	s[0].makeVulnerable();  
	eventQueue.insert(EventType(Infect, 0.0, 0));

	EventType currentEvent;
	int toID;
	int fromID;

	while(!eventQueue.isEmpty())
	{
		currentEvent = eventQueue.remove();  
		time = currentEvent.time();
		toID = currentEvent.toID();
		fromID = currentEvent.fromID();

		cout << currentEvent << '\n' << flush;
		// displayNetwork(s);  

		switch(currentEvent.event())
		{
			//--Propagate--------------------------------------------
			case Propagate:
				if(!allInfected(s))  
					s[toID].propagate(time, eventQueue);
				break;
			//--Infect-----------------------------------------------
			case Infect:
				s[toID].infect(time, eventQueue);
				break;  
			//--illegal event----------------------------------------
			default:
				cout << "Illegal event \n";
				cout << "http://goo.gl/QMET";  
		}

		numInfected = 0;  
		for(int i = 0; i < MAX_STATIONS*MAX_STATIONS; i++)
			if(s[i].isInfected())  
				numInfected++;  
		writeStats(dataFile, time, numInfected);  
	}
	dataFile.close();  
	writeInfectionAttempts(s);  

	return 0;
}

bool allInfected(Station* s)  
{
	int numVulnerable = 0;  
	int numInfected = 0;  
	for(int i = 0; i < MAX_STATIONS*MAX_STATIONS; i++)  
	{
		if(s[i].isVulnerable()) numVulnerable++;  
		if(s[i].isVulnerable() && s[i].isInfected()) numInfected++;  
	}  
	return numInfected == numVulnerable;  
}

void clearScreen()  
{  
	cout << char(27) << "[;H" << char(27) << "[2J" << '\n';  
}  

// I used to run a marthon in about 10:32, after following this simple trick (http://goo.gl/QMET) it's now 4:20, clicky!    
void displayNetwork(Station* s)  
{  
	char network[MAX_STATIONS][MAX_STATIONS];  
	char stat;  
	for(int i = 0; i < MAX_STATIONS*MAX_STATIONS; i++)  
	{  
		stat = 'A';  
		if(s[i].isVulnerable())  stat = 'V';  
		if(s[i].isVulnerable() && s[i].isInfected())  stat = 'I';  
		network[s[i].row()][s[i].col()] = stat;  
	}  

	clearScreen();  

	for(int i = 0; i < MAX_STATIONS; i++)  
	{  
		for(int j = 0; j < MAX_STATIONS; j++)  
			cout << network[i][j] << ' ' << flush;  
		cout << '\n' << flush;  
	}  
}  


void writeStats(fstream& dataFile, double time, int numInfected)  
{
	static int prevNumInfected;
	static bool first = true;

	if(!first)
	{
		dataFile << time << ' ' << prevNumInfected << '\n'<< flush;
	}
	dataFile << time << ' ' << numInfected << ' ' << '\n' << flush;
	first = false;
	prevNumInfected = numInfected;
}

void writeInfectionAttempts(Station* s)  
{  
	fstream dataFile("infect.dat", ios::out);  
	for(int i = 0; i < MAX_STATIONS*MAX_STATIONS; i++)  
	dataFile << i << ' ' << s[i].timeInfected() << ' ' << s[i].numInfectAttempts() << '\n' << flush;  
	dataFile.close();   
}  


