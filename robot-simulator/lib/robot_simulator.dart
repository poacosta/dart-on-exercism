import 'orientation.dart';
import 'position.dart';

class Robot {
  final int orientationLength = Orientation.values.length;
  Orientation orientation;
  Position position;

  Robot(this.position, this.orientation);

  void move(String instructions) => instructions.split('').forEach(
        (i) {
          switch (i) {
            case 'L':
              this.orientation = Orientation.values[
                  (orientationLength + this.orientation.index - 1) %
                      orientationLength];
              break;
            case 'R':
              this.orientation = Orientation
                  .values[(this.orientation.index + 1) % orientationLength];
              break;
            case 'A':
              this.advance();
              break;
          }
        },
      );

  void advance() {
    switch (this.orientation) {
      case Orientation.east:
        this.position.x++;
        break;
      case Orientation.west:
        this.position.x--;
        break;
      case Orientation.north:
        this.position.y++;
        break;
      case Orientation.south:
        this.position.y--;
        break;
    }
  }
}
