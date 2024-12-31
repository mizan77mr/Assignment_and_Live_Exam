abstract class Role{
  void displayRole();

}

class Person implements Role{
  String name;
  int age;
  String address;


  Person(this.name,this.age,this.address);

  @override
  void displayRole() {


  }




}



class Student extends Person{
  String studentId;
  String grade;
  List<double>courseScores;

Student(this.studentId,this.grade,this.courseScores):super('John Doe',20,'123 Main St');
  
@override
  void displayRole(){

  print('Role:Student');
}

 double calculateAverageScore() {
    double sum = 0.0;
    for (double score in courseScores) {
      sum += score;
    }
    return sum / courseScores.length;
  }

}


class Teacher extends Person{
  String teacherID;
  List<String>coursesTaught;


  Teacher(this.teacherID,this.coursesTaught):super('Mrs.Smith',35,'456 Oak St');

  @override
  void displayRole(){

    print('Role:Teacher');
  }

  void displayCoursesTaught() {
    print('Course Taught:');
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}



void main(){

  Student student=Student("S345", "A", [90.0,85.0,82.0]);
  print("\nStudent Information:\n\n");

  student.displayRole();
  print('Name: ${student.name}');
  print("Age: ${student.age}");
  print('Address: ${student.address}');
  print('Average Score: ${student.calculateAverageScore()}');

  
  Teacher teacher=Teacher('T465', ['Math','English','Bangla']);

  print("\n\nTeacher Information:\n\n");
  teacher.displayRole();
  print('Name: ${teacher.name}');
  print('Age: ${teacher.age}');
  print('Address: ${teacher.address}');
  teacher.displayCoursesTaught();


}