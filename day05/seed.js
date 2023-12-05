const fs = require('fs');

const data = fs.readFileSync('seed.txt', 'utf8').split('\n\n');
const seeds = data[0].split(': ')[1].split(' ').map(Number);
const maps = data.slice(1).map(m => m.split('\n').slice(1).map(line => line.split(' ').map(Number)));

const transformations = maps.map(m => {
    return {
        forward: x => m.find(([target, source, n]) => source <= x && x < source + n)?.[0] + x - m.find(([target, source, n]) => source <= x && x < source + n)?.[1] || x,
        inverse: x => m.find(([source, target, n]) => source <= x && x < source + n)?.[0] + x - m.find(([source, target, n]) => source <= x && x < source + n)?.[1] || x
    };
});

const compose = (...fns) => x => fns.reduceRight((v, f) => f(v), x);

// Part 1
console.log(Math.min(...seeds.map(compose(...transformations.map(t => t.forward)))));

// Part 2
const isNeeded = n => seeds.some((x, i) => i % 2 === 0 && x <= n && n < x + seeds[i + 1]);
const isSeedLoc = compose(isNeeded, compose(...transformations.map(t => t.inverse)));
console.log([...Array(10000).keys()].find(isSeedLoc));