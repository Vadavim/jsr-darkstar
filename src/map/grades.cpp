﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "grades.h"

/************************************************************************
*																		*
*  Таблицы расчета характеристик сушностей								*
*																		*
************************************************************************/

/************************************************************************
*																		*
*  Массив с уровнями характеристик по профессиям						*
*																		*
************************************************************************/

uint8 JobGrades[23][9] =
{
//  HP,MP,STR,DEX,VIT,AGI,INT,MND,CHR
	{0, 0, 0, 0, 0, 0, 0, 0, 0}, //NON
	{2, 0, 1, 3, 4, 3, 6, 6, 5}, //WAR
	{1, 0, 3, 2, 1, 6, 7, 4, 5}, //MNK
	{5, 3, 4, 6, 4, 5, 5, 1, 3}, //WHM
	{6, 2, 6, 3, 6, 3, 1, 5, 4}, //BLM
	{4, 4, 4, 4, 5, 5, 3, 3, 4}, //RDM
	{4, 0, 4, 1, 4, 2, 3, 7, 7}, //THF
	{3, 6, 2, 5, 1, 7, 7, 3, 3}, //PLD
	{3, 6, 1, 3, 3, 4, 3, 7, 7}, //DRK
	{3, 0, 4, 3, 4, 6, 5, 5, 1}, //BST
	{4, 0, 4, 4, 4, 6, 4, 4, 2}, //BRD
	{5, 0, 5, 4, 4, 1, 5, 4, 5}, //RNG
	{2, 0, 3, 3, 3, 4, 5, 5, 4}, //SAM
	{4, 0, 3, 2, 3, 2, 4, 7, 6}, //NIN
	{3, 0, 2, 4, 3, 4, 6, 5, 3}, //DRG
	{7, 1, 6, 5, 6, 4, 2, 2, 2}, //SMN
	{4, 4, 5, 5, 5, 5, 5, 5, 5}, //BLU
	{4, 0, 5, 3, 5, 2, 3, 5, 5}, //COR
	{4, 0, 5, 2, 4, 3, 5, 6, 3}, //PUP
	{4, 0, 4, 3, 5, 2, 6, 6, 2}, //DNC
	{5, 4, 6, 4, 5, 4, 3, 4, 3}, //SCH
    {4, 3, 4, 4, 5, 5, 2, 5, 4}, //GEO
    {2, 5, 3, 2, 4, 2, 4, 4, 4}, //RUN
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/
         
uint8 RaceGrades[5][9] = 
{
//  HP,MP,STR,DEX,VIT,AGI,INT,MND
	{4, 4, 4, 4, 4, 4, 4, 4, 4}, //Hume
	{3, 5, 2, 5, 3, 6, 6, 2, 4}, //Elvaan
	{7, 1, 6, 4, 5, 3, 1, 5, 4}, //Tarutaru
	{4, 4, 5, 1, 5, 2, 4, 5, 6}, //Mithra
	{1, 7, 3, 4, 1, 5, 5, 4, 6}, //Galka
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float HPScale[8][5] =
{
//base,<30,<60,<75,>75
	{ 0, 0,	0, 0, 0}, //0
	{19, 9,	1, 3, 3}, //A
	{17, 8,	1, 3, 3}, //B
	{16, 7,	1, 3, 3}, //C
	{14, 6,	0, 3, 3}, //D
	{13, 5,	0, 2, 2}, //E
	{11, 4,	0, 2, 2}, //F
	{10, 3, 0, 2, 2}, //G
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float MPScale[8][4] = 
{
//  base,<60,>60
	{ 0, 0,   0}, //0
	{16, 6,   4}, //A
	{14, 5,   4}, //B
	{12, 4,   4}, //C
	{10, 3,   4}, //D
	{ 8, 2,   3}, //E
	{ 6, 1,   2}, //F
	{ 4, 0.5, 1}, //G
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float StatScale[8][4] = 
{
// base   <60   <75   >75
	{0,	    0,    0,    0}, //0
	{5,	 0.50, 0.10, 0.35}, //A
	{4,	 0.45, 0.20, 0.35}, //B
	{4,	 0.40, 0.25, 0.35}, //C
	{3,	 0.35, 0.35, 0.35}, //D
	{3,	 0.30, 0.35, 0.35}, //E
	{2,	 0.25, 0.40, 0.35}, //F
	{2,	 0.20, 0.40, 0.35}, //G
};

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

namespace grade
{

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

uint8 GetJobGrade(JOBTYPE job, uint8 stat)
{
	//DSP_DEBUG_BREAK_IF(job >= MAX_JOBTYPE || stat > 8);	// выход за пределы массива

	return JobGrades[job][stat];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

uint8 GetRaceGrades(uint8 race, uint8 stat)
{
	//DSP_DEBUG_BREAK_IF(race > 4 || stat > 8);	// выход за пределы массива

	return RaceGrades[race][stat];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float GetHPScale(uint8 rank, uint8 scale)
{
	//DSP_DEBUG_BREAK_IF(rank > 7 || scale > 4);	// выход за пределы массива

	return HPScale[rank][scale];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float GetMPScale(uint8 rank, uint8 scale)
{
	//DSP_DEBUG_BREAK_IF(rank > 7 || scale > 3);	// выход за пределы массива

	return MPScale[rank][scale];
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/

float GetStatScale(uint8 rank, uint8 scale)
{
	//DSP_DEBUG_BREAK_IF(rank > 7 || scale > 3);	// выход за пределы массива

	return StatScale[rank][scale];
}

}; // namespace grade