//
//  CoreNLPPhraseSplitter.m
//  ADeriverLinguistic
//
//  Created by Juan Manuel Moreno on 10/09/24.
//

//#import <Foundation/Foundation.h>
#import "CoreNLPPhraseSplitter.h"

@implementation CoreNLPPhraseSplitter {
    JNIEnv *env;
    JavaVM *jvm;
    jobject coreNLPWrapperObject;
}

-(instancetype)init {
    self =  [super init];
    return self;
}

-(NSArray *)splitSting:(NSString *)input {
    
    if (env == NULL) {
        NSLog(@"KO");
        return nil;
    } else {
//        jclass clazz = (*env)->FindClass(env, "java/lang/String");
        
        // Convert the input string to a Java string
//        jstring inputString = (*env)->NewStringUTF([input UTF8String]);
        jstring inputString = (*env)->NewStringUTF(env, [input UTF8String]);

        // Get the splitPhrases method
//        jmethodID splitPhrasesMethod = (*env)->GetMethodID((*env)->GetObjectClass(coreNLPWrapperObject), "splitSting", "(Ljava/lang/String;)[Ljava/lang/String;");
        jclass clazz = (*env)->GetObjectClass(env, coreNLPWrapperObject);
        jmethodID splitPhrasesMethod = (*env)->GetMethodID(env, clazz, "splitSting", "(Ljava/lang/String;)[Ljava/lang/String;]");

        // Call the splitPhrases method
//        jobjectArray phrasesArray = (jobjectArray)env->CallObjectMethod(coreNLPWrapperObject, splitPhrasesMethod, inputString);
//
//        // Convert the Java array to an Objective-C array
//        NSMutableArray *phrases = [NSMutableArray array];
//        for (int i = 0; i < env->GetArrayLength(phrasesArray); i++) {
//            jstring phraseString = (jstring)env->GetObjectArrayElement(phrasesArray, i);
//            NSString *phrase = [NSString stringWithUTF8String:env->GetStringUTFChars(phraseString, NULL)];
//            [phrases addObject:phrase];
//        }
//
//        return phrases;
        return nil;
    }

}

-(void)dealloc {
    
}

@end

//#import <Foundation/Foundation.h>
//#import <JavaVM/jni.h>
//
//@interface CoreNLPPhraseSplitter : NSObject
//
//- (NSArray *)splitPhrases:(NSString *)input;
//
//@end
//
//@implementation CoreNLPPhraseSplitter {
//    JNIEnv *env;
//    JavaVM *jvm;
//    jobject coreNLPWrapperObject;
//}
//
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        // Load the Java VM
//        JavaVMInitArgs vm_args;
//        vm_args.version = JNI_VERSION_1_8;
//        vm_args.nOptions = 0;
//        vm_args.options = NULL;
//        vm_args.ignoreUnrecognized = false;
//
//        int ret = JNI_CreateJavaVM(&jvm, (void **)&env, &vm_args);
//        if (ret < 0) {
//            NSLog(@"Failed to create Java VM");
//            return nil;
//        }
//
//        // Get the CoreNLPWrapper class
//        jclass coreNLPWrapperClass = env->FindClass("CoreNLPWrapper");
//        if (!coreNLPWrapperClass) {
//            NSLog(@"Failed to find CoreNLPWrapper class");
//            return nil;
//        }
//
//        // Create a CoreNLPWrapper object
//        coreNLPWrapperObject = env->NewObject(coreNLPWrapperClass, "CoreNLPWrapper", "()V");
//        if (!coreNLPWrapperObject) {
//            NSLog(@"Failed to create CoreNLPWrapper object");
//            return nil;
//        }
//    }
//    return self;
//}
//
//- (NSArray *)splitPhrases:(NSString *)input {
//    // Convert the input string to a Java string
//    jstring inputString = env->NewStringUTF([input UTF8String]);
//
//    // Get the splitPhrases method
//    jmethodID splitPhrasesMethod = env->GetMethodID(env->GetObjectClass(coreNLPWrapperObject), "splitPhrases", "(Ljava/lang/String;)[Ljava/lang/String;");
//
//    // Call the splitPhrases method
//    jobjectArray phrasesArray = (jobjectArray)env->CallObjectMethod(coreNLPWrapperObject, splitPhrasesMethod, inputString);
//
//    // Convert the Java array to an Objective-C array
//    NSMutableArray *phrases = [NSMutableArray array];
//    for (int i = 0; i < env->GetArrayLength(phrasesArray); i++) {
//        jstring phraseString = (jstring)env->GetObjectArrayElement(phrasesArray, i);
//        NSString *phrase = [NSString stringWithUTF8String:env->GetStringUTFChars(phraseString, NULL)];
//        [phrases addObject:phrase];
//    }
//
//    return phrases;
//}
//
//- (void)dealloc {
//    // Release resources
//    env->DeleteLocalRef(coreNLPWrapperObject);
//    JNI_DestroyJavaVM(jvm);
//}
//
//@end

//CoreNLPPhraseSplitter *splitter = [[CoreNLPPhraseSplitter alloc] init];
//NSArray *phrases = [splitter splitPhrases:@"Hello world. This is a test sentence."];
//NSLog(@"%@", phrases);
