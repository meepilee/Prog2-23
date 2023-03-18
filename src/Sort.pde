
class Sort {//import java.util.*;
//import java.lang.Math.*;

//public class Main {
//  static Scanner scan = new Scanner(System.in);
//  static ArrayList<Integer> list = new ArrayList<Integer>();
  

  //public static void main(String[] args) {
  //  new java.util.Random();
  //  createList();
  //  System.out.println("Here is the list, unsorted. But not for long? Pls?\n" + list);
  //  heapSort(list,list.size());
  //  System.out.println("Sorted List:");
  //  System.out.println(list);
  //}
  //public static ArrayList<Integer> createList () {
  //  // System.out.println("Type in the numbers to sort one at a time in no particular order and type 'done' when ... done ig");
  //  // boolean done = false;
  //  // String scanNextLine;
  //  // while (!done) {
  //  //   scanNextLine=scan.nextLine();
  //  //   if (scanNextLine.equals("done")) {
  //  //     done = true;
  //  //     break;
  //  //   } else {
  //  //     try {
  //  //       list.add(Integer.valueOf(scanNextLine));
  //  //     } catch (Exception e) {
  //  //       System.out.println("Please make sure that only integers are put in here");
  //  for (int i = 0; i <500; i++) {
      
  //    list.add((int)(Math.random()*72727));
  //  }
  //      //}
  //    //}
  //  //}
  //  return list;
  //}
  //you can tell when i gave up and stole it from the website kapptie linked
  void heapify(ArrayList<Bloon> list, int pointer, int listSize)  
  {  
      int largest = pointer; // Initialize largest as root  
      int left = 2 * pointer + 1; // left child  
      int right = 2 * pointer + 2; // right child  
      // If child is larger than root  
      if (left < listSize && list.get(left).distTraveled > list.get(largest).distTraveled) {
          largest = left;
          } 
      if (right < listSize && list.get(right).distTraveled > list.get(largest).distTraveled) {
          largest = right;
          } 
      if (largest != pointer) {  
        //swap so that the largest number gets put first
          Bloon temp = list.get(pointer);  
          list.set(pointer, list.get(largest));  
          list.set(largest, temp);
          
          //woo recursion
         // System.out.println(list);
          heapify(list, largest, listSize);  
      }  
      
  }  
 void heapSort(ArrayList<Bloon> list, int listSize)  
  {  
    //this for loop goes through the entire binary tree and basically looks for the largest thing
      for (int pointer = listSize / 2 - 1/*Start at the middle of the list*/; pointer >= 0; pointer--) {
        //System.out.println(list);
          heapify(list, pointer, listSize);  
      }
      // One by one extract an element from heap  
      for (int putOnTop = listSize - 1; putOnTop >= 0; putOnTop--) {  
          Bloon temp = list.get(0);  
          list.set(0,list.get(putOnTop));  
          list.set(putOnTop,temp);
          //System.out.println(list);
          heapify(list, 0, putOnTop);  
      }  
  }  
  }
