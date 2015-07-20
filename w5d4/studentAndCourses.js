var Student = function(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
};

Student.prototype.name = function() {
  return this.firstName + ' ' + this.lastName;
};

Student.prototype.courses = function() {
  return this.courses;
};

Student.prototype.enroll = function(course) {
  if (this.courses.indexOf(this) === -1) {
    this.courses.forEach(function(crs) {
      if (crs.conflictsWith(course)) {
        throw 'Course conflict';
      }
    });
    this.courses.push(course);
    course.addStudent(this);
  }

};

var Course = function(title, department, credits, days, block) {
  this.title = title;
  this.department = department;
  this.credits = credits;
  this.date = days;
  this.block = block;
  this.students = [];
};

Course.prototype.addStudent = function(student) {
  if (this.students.indexOf(student) === -1)
    this.students.push(student);
  }
};

Course.prototype.conflictsWith = function(course) {
  if (this.block !== course.block) { return false; }

  return this.days.some(function(day) {
    return course.days.indexOf(day) !== -1;
  });

};

var student1 = new Student('tuan', 'hoang');
var student2 = new Student('albert', 'hoang');

var course1 = new Course('MATH101', 'mathematics', 3);
var course2 = new Course('MATH404', 'mathematics', 3);
var course3 = new Course('MATH321', 'mathematics', 3);


student1.enroll(course1);
student1.enroll(course1);
student2.enroll(course1);

console.log(student1.name());
console.log(student1.courses);

console.log(student2.name());
console.log(student2.courses);

console.log(course1.students);
console.log(course2.students);
