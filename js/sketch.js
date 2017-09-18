function setup() {
let spacebrew = new Spacebrew()
    ,onBooleanMessage = (msg) => {
        console.log('[onBooleanMessage]',msg)
    }
spacebrew.addPublish("button","boolean",0)
spacebrew.addSubscribe("background","boolean",0)
spacebrew.onBooleanMessage( onBooleanMessage )
spacebrew.connect("localhost",9000,"DEMO")

    createCanvas(300,300);
    background('red')
}