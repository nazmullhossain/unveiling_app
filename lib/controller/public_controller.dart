// import 'package:get/get_rx/src/rx_types/rx_types.dart';
//
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../helper/db_helper.dart';
//
// import '../model/book_model.dart';
// import '../model/chapter_model.dart';
//
// class Controller extends GetxController {
//   Controller() {
//     getData();
//     getChapterData();
//   }
//   DbHelper localDatabase = DbHelper();
//
//   void data() {
//     print("hellow data");
//   }
//
//   List<BooksModel> bookData = <BooksModel>[].obs;
//   getData() async {
//     bookData = await localDatabase.getBooks();
//     print("book data${bookData!.length}");
//   }
//
//   List<ChapterModel> chapterData = <ChapterModel>[].obs;
//   getChapterData() async {
//     chapterData = await localDatabase.getChapter();
//     print("book data${bookData!.length}");
//   }
// }
