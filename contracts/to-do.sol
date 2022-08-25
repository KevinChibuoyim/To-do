// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract To_Do_List {

    uint public ItemNumber = 0;

    struct ToDoLayout {
        uint ID;
        string Item;
        bool IsDone;
        
    }

    mapping (uint => ToDoLayout) public todolayout;

    event CreateItemsToDo(uint ID, string Task, bool ItemCreated);
    event CreateItemStatus(uint ID, bool IsDoneOrNot);


    function SetUpToDoList(string memory _item) public {

        todolayout[ItemNumber] = ToDoLayout(ItemNumber, _item, false);
        ItemNumber++;

        emit CreateItemsToDo(ItemNumber, _item, false);
    }

    function ViewItemsOnToDoList(uint index) external view returns (ToDoLayout memory) {
        ToDoLayout memory _todolayout = todolayout[index];
        return _todolayout;
    }

    function SetItemStatus(uint _id, bool _IsDoneOrNot) external {
        ToDoLayout memory _todolayout = todolayout[_id];
        _todolayout.IsDone = _IsDoneOrNot;

        emit CreateItemStatus(_id, _IsDoneOrNot);

    }

    function RemoveTaskFromList(uint RemoveThisTask) external {
        delete todolayout[RemoveThisTask].ID;

    }
}