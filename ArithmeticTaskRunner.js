class ArithmeticTaskRunner {
    constructor() {
        this.tasks = [];
    }
    addNegationTask() {
        this.tasks.push(x => -x);
    }
    addAdditionTask(y) {
        this.tasks.push(x => x + y);
    }
    addMultiplicationTask(y) {
        this.tasks.push(x => x * y);
    }
    get taskCount() {
        return this.tasks.length;
    }
    execute(startValue = 0) {
        return this.tasks.reduce((t, v) => v(t), startValue);

        // this.tasks.forEach(task => startValue = task(startValue));
        // return startValue;

        // this.tasks.forEach(task => {
        //     startValue = task(startValue);
        // }); return startValue;

        // this.tasks.forEach(function(task) {
        //     startValue = task(startValue);
        // }); return startValue;

        // for (let i = 0; i < this.tasks.length; i++) startValue = tasks[i](startValue);
        // return startValue;

        // for (let i = 0; i < this.tasks.length; i++) {
        //     startValue = tasks[i](startValue);
        // } return startValue;
    }
}

let test = new ArithmeticTaskRunner();
test.addAdditionTask(8);
test.addAdditionTask(8);
test.addAdditionTask(8);
test.addNegationTask();
console.log(test.execute(2));