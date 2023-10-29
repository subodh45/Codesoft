import java.util.Random;
import java.io.*;

class NumGuess
{
 public static void main(String args[])
 {
     Random random = new Random();
        
        // Generating a random number between 1 and 100
        int randomNumber = random.nextInt(100) + 1;

System.out.println("computer no= " + randomNumber);

for(int n=1;n<=3;n++)
{
     
    Console c = System.console();

    int num = Integer.parseInt(c.readLine("enter no "));

   if(num!=randomNumber)   
    {  System.out.println("number didn't match ");
       if(num-randomNumber <=10 && num-randomNumber >0)
        {System.out.println("Little Lower than your number ");}
       else if(num-randomNumber <=40 && num-randomNumber >0)
        {System.out.println("Very Low than your number ");}
       else if(randomNumber-num<=10 && randomNumber-num >0)
        {System.out.println("Little Higher than your number ");}
       else if(randomNumber-num<=40 && randomNumber-num >0)
        {System.out.println("Very high than your number ");}
       
     } 
   else
     {
       System.out.println("You guess the number Correctly.");
     System.out.println("computer no= " + randomNumber);
     System.out.println("Your number " + num);
     System.exit(0);
    }
  
}
 System.out.println("failed to guess number.");
 System.out.println("Actual no. is "+ randomNumber);
 }
}