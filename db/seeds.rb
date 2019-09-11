languages = [
  {
    name: "C (gcc 8.1.0)",
    source_file: "main.c",
    compile_cmd: "env LC_ALL= LANGUAGE= LC_LANG= LC_CTYPE=C /usr/bin/gcc main.c -lm",
    run_cmd: "./a.out"
  },
  {
    name: "C++ (g++ 8.1.0)",
    source_file: "main.cpp",
    compile_cmd: "env LC_ALL= LANGUAGE= LC_LANG= LC_CTYPE=C /usr/bin/g++ main.cpp",
    run_cmd: "./a.out"
  },
  {
    name: "Java (OpenJDK 10 with Eclipse OpenJ10)",
    source_file: "Main.java",
    compile_cmd: "/usr/local/openjdk10-openj10/bin/javac Main.java",
    run_cmd: "/usr/local/openjdk10-openj10/bin/java Main"
  },
  {
    name: "Python (3.7.0)",
    source_file: "main.py",
    run_cmd: "/usr/bin/python3 main.py"
  },
  {
    name: "Python (2.7.9)",
    source_file: "main.py",
    run_cmd: "/usr/bin/python main.py"
  },
  {
    name: "Text (plain text)",
    source_file: "source.txt",
    run_cmd: "/bin/cat source.txt"
  }
]


Language.delete_all
ActiveRecord::Base.connection.reset_pk_sequence!('languages')

languages.each do |language|
  Language.create(
    name: language[:name],
    compile_cmd: language[:compile_cmd],
    run_cmd: language[:run_cmd],
    source_file: language[:source_file]
  )
end

