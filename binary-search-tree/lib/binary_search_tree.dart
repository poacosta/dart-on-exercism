class Node {
  String data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  BinarySearchTree(String data) {
    root = Node(data);
  }

  void insert(String data) {
    if (root == null) {
      root = Node(data);
    } else {
      _insert(root!, data);
    }
  }

  void _insert(Node node, String data) {
    if (data.compareTo(node.data) <= 0) {
      if (node.left == null) {
        node.left = Node(data);
      } else {
        _insert(node.left!, data);
      }
    } else {
      if (node.right == null) {
        node.right = Node(data);
      } else {
        _insert(node.right!, data);
      }
    }
  }

  List<String> get sortedData {
    final result = <String>[];
    _sortedData(root!, result);
    return result;
  }

  void _sortedData(Node node, List<String> result) {
    if (node.left != null) {
      _sortedData(node.left!, result);
    }
    result.add(node.data);
    if (node.right != null) {
      _sortedData(node.right!, result);
    }
  }
}
