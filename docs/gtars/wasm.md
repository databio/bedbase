# gtars-wasm

WebAssembly bindings for browser-based genomic tools, enabling client-side genomic analysis.

## Features

- Zero-installation genomic tools
- Client-side processing (no server required)
- JavaScript/TypeScript interoperability
- Small bundle size (~200KB gzipped)

## Usage

### JavaScript
```javascript
import init, { TreeTokenizer } from 'gtars-wasm';

await init();

const tokenizer = new TreeTokenizer();
const tokens = tokenizer.tokenize("chr1:1000-2000");
```

### TypeScript
```typescript
import init, { TreeTokenizer, Region } from 'gtars-wasm';

await init();

const tokenizer = new TreeTokenizer();
const region: Region = { chr: "chr1", start: 1000, end: 2000 };
const tokens: number[] = tokenizer.tokenizeRegion(region);
```

## Available Functions

- Region tokenization
- Sequence hashing (MD5, SHA)
- Basic interval operations
- BED file parsing (client-side)

## Integration

### React
```jsx
import { useEffect, useState } from 'react';
import init, { TreeTokenizer } from 'gtars-wasm';

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
