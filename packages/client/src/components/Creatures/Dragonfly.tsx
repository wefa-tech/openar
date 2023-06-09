/*
Prepare your Model as gltf/glb and put it in project folder, "cd" to folder
Model Group and Animation Intregration: Auto-generated by: https://github.com/pmndrs/gltfjsx
Command: npx gltfjsx Kugelmonster3.glb --transform
-> copy jsx, rename it, check pathes and adapt to your requirements, 
-> copy transformed glb from root to public  
*/

import { useRef, useEffect, useMemo } from "react";
import { useGLTF, useAnimations, useTexture } from "@react-three/drei";
import { useLoader, useGraph } from '@react-three/fiber'
import { TextureLoader, DoubleSide } from 'three'
import * as SkeletonUtils from 'three/addons/utils/SkeletonUtils.js';

useTexture.preload('/DragonflyTextureRGB.jpg')

export default function DragonflyTicTacToe(props:any) 
{

    /**
     * Model Loading
     */
    // Autocode: Prepare Group
    const group = useRef();
    // Autocode Load Model (materials not needed if no materials used)
    // const { nodes, materials, animations } = useGLTF("./Kugelmonster/KugelmonsterDraco-transformed.glb");
    const { scene, animations  } = useGLTF("/DragonflyTicTacToe-transformed.glb") as any;
    const clone = useMemo(() => SkeletonUtils.clone(scene), [scene])
    const { nodes } = useGraph(clone) as any
    // const { actions } = useAnimations(animations, group)
    
    
    /**
     * Texture Loading
     */
    const shadowTexture = useTexture('/DragonflyTextureRGB.jpg')
    shadowTexture.flipY = false  // Texture looks weired: Flip y

    
    /**
     * Load Animations (Autocode - name changed)
     */
    const animationsToPlay = useAnimations(animations, group);
    console.log(animationsToPlay) // Control what is loaded

    /**
     * Prepare Graphical User Interface - Leva
     */
    const AnimTicTacToe = animationsToPlay.names[0]
    //
    // Prepare listener to user changes GUI
    // (& Play animation on first render)
    //
    useEffect(() => 
    {
        const action = animationsToPlay.actions[AnimTicTacToe]
        action?.reset()        // Tweak Transition between Animations (can be done in Blender also)
                .fadeIn(0.1)    // -> starting smooth
                .play()         // -> play 

        return () =>            // return will be called on dispose or rerender (in useEffect)
        {                       
            action?.fadeOut(0.1) // -> ending smooth
        }
    }, [props.animation || AnimTicTacToe])
    
    const headColor='#2eba4c';
    const bodyColor='#0076d7';
    const armsLegsColor= "#2eba4c";
    const glow= 2;
    const opacity= 0.15
    

    return (
        <>
            <group ref={group} {...props} dispose={null}>
                <group name="Scene">
                    <group name="root">
                        <primitive object={nodes.root_1} />
                        <skinnedMesh name="antenasTop" geometry={nodes.antenasTop.geometry} skeleton={nodes.antenasTop.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ [ 1, 4,  2 * glow ] } toneMapped={ false }/>
                        </skinnedMesh>
                        <skinnedMesh name="arms" geometry={nodes.arms.geometry} skeleton={nodes.arms.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ armsLegsColor } toneMapped={ false } />
                        </skinnedMesh>
                        <skinnedMesh name="body" geometry={nodes.body.geometry} skeleton={nodes.body.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ bodyColor } toneMapped={ false }/>
                        </skinnedMesh>
                        <skinnedMesh name="feetsHips" geometry={nodes.feetsHips.geometry} skeleton={nodes.feetsHips.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ bodyColor } toneMapped={ false } />
                        </skinnedMesh>
                        <skinnedMesh name="hands" geometry={nodes.hands.geometry} skeleton={nodes.hands.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ bodyColor } toneMapped={ false } />
                        </skinnedMesh>
                        <skinnedMesh name="head" geometry={nodes.head_1.geometry}skeleton={nodes.head_1.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ headColor } toneMapped={ false }/>
                        </skinnedMesh>
                        <skinnedMesh name="legs" geometry={nodes.legs.geometry} skeleton={nodes.legs.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ armsLegsColor } toneMapped={ false } />
                        </skinnedMesh>
                        <skinnedMesh name="wingsCovering" geometry={nodes.wingsCovering.geometry} skeleton={nodes.wingsCovering.skeleton} >
                            <meshBasicMaterial map={ shadowTexture } side={ DoubleSide }  toneMapped={ false } transparent={ true } opacity={ opacity}/>
                        </skinnedMesh>
                        <skinnedMesh name="wingsStructure" geometry={nodes.wingsStructure.geometry} skeleton={nodes.wingsStructure.skeleton} >
                            <meshBasicMaterial map={shadowTexture} side={ DoubleSide } color={ [ 1  , 4 , 2 * glow ] } toneMapped={ false }/>
                        </skinnedMesh>
                    </group>
                </group>
            </group>       
       </>
    );
}
useGLTF.preload("/DragonflyTicTacToe-transformed.glb");