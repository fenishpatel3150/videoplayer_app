
import 'package:flutter/cupertino.dart';

class VideoProvider extends ChangeNotifier
{
  List shortList= [];
  int addIndex=0;
  bool playing=true;
  bool likethis=true;
  int index=0;
  void Video (int index)
  {
    addIndex=index;
    notifyListeners();
  }


  void PlayVideo ()
  {
    playing=!playing;
    notifyListeners();
  }

  void videoindex()
  {
    index=index;
    notifyListeners();
  }

}