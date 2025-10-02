# gtars Wasm/JS

We provide WebAssembly (Wasm) bindings for gtars functionality, enabling genomic interval analysis in JavaScript/TypeScript environments. This allows for client-side processing of genomic data without the need for server-side computation.

## Features

- Zero-installation genomic tools
- Client-side processing (no server required)
- JavaScript/TypeScript interoperability

## Installation
You can install the gtars Wasm package via npm:

```bash
npm install @databio/gtars-js
```

## Usage
We don't currently provide full feature parity bindings, but some functionality is available.

```typescript
import init, { Overlapper } from 'gtars-js';

await init();

import { Overlapper } from '@databio/gtars-js';

const universe = [
    ['chr1', 100, 200],
    ['chr1', 150, 250],
    ['chr2', 300, 400],
]

const overlapper = new Overlapper(universe, 'ailist');
console.log(`Using backend: ${overlapper.get_backend()}`);

const query = ['chr1', 180, 220];
const overlaps = overlapper.find(query);

console.log(`Overlaps for ${query}:`, overlaps);
```

## Integration

### An example React component
```jsx
import { useEffect, useState } from 'react';
import init, { TreeTokenizer } from 'gtars-js';

function TokenizerComponent() {
  const [tokenizer, setTokenizer] = useState(null);

  useEffect(() => {
    init().then(() => {
      setTokenizer(new TreeTokenizer());
    });
  }, []);

  // Use tokenizer...
}
```
