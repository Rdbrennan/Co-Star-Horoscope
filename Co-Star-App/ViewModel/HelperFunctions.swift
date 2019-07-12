//
//  HelperFunctions.swift
//  Co-Star-App
//
//  Created by Robert Brennan on 7/12/19.
//  Copyright © 2019 Creatility. All rights reserved.
//

import Foundation

class HelperFunctions{
    
    /*
     * Zodiac Calculation
     */
    func zodiacSigns(day: Int, Month:String) -> String{
        var astroSign=""
        // checks month and date within the
        // valid range of a specified zodiac
        if (Month == "December"){
            if (day < 22){
                astroSign = "Sagittarius"
            }
            else{
                astroSign = "capricorn"
            }
        }
        else if (Month == "January"){
            if (day < 20){
                astroSign = "Capricorn"
            }
            else{
                astroSign = "aquarius"
            }
        }
        else if (Month == "February"){
            if (day < 19){
                astroSign = "Aquarius"
            }
            else{
                astroSign = "pisces"
            }
        }
        else if(Month == "March"){
            if (day < 21){
                astroSign = "Pisces"
            }
            else{
                astroSign = "aries"
            }
        }
        else if (Month == "April"){
            if (day < 20){
                astroSign = "Aries"
            }
            else{
                astroSign = "taurus"
            }
        }
        else if (Month == "May"){
            if (day < 21){
                astroSign = "Taurus"
            }
            else{
                astroSign = "Gemini"
            }
        }
        else if( Month == "June"){
            if (day < 21){
                astroSign = "Gemini"
            }
            else{
                astroSign = "cancer"
            }
        }
        else if (Month == "July"){
            if (day < 23){
                astroSign = "Cancer"
            }
            else{
                astroSign = "leo"
            }
        }
        else if(Month == "August"){
            if (day < 23){
                astroSign = "Leo"
            }
            else{
                astroSign = "virgo";
            }
        }
        else if (Month == "September"){
            if (day < 23){
                astroSign = "Virgo"
            }
            else{
                astroSign = "libra"
            }
        }
        else if (Month == "October"){
            if (day < 23){
                astroSign = "Libra"
            }
            else{
                astroSign = "Scorpio"
            }
        }
        else if (Month == "November"){
            if (day < 22){
                astroSign = "Scorpio"
            }
            else{
                astroSign = "Sagittarius"
            }
        }
        return astroSign;
    }
}
